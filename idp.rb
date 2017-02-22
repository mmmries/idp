require "bundler/setup"
require "sinatra"
require "ruby-saml-idp"
require "base64"

class ResponseGenerator
  include ::SamlIdp::Controller

  def initialize(sp_url)
    self.saml_acs_url = sp_url
    @saml_request_id = "a#{SecureRandom.uuid.gsub("-","")}"
  end

  def saml_response(name_id)
    encode_SAMLResponse(name_id)
  end
end

get "/" do
  erb :"index.html"
end

post "/go" do
  name_id = params["name_id"]
  @sp_url = params["sp_url"]
  @relay_state = params["relay_state"]
  response_generator = ::ResponseGenerator.new(@sp_url)

  response_generator.secret_key = params["secret_key"] if !params["secret_key"].empty?
  response_generator.x509_certificate = Base64.encode64(params["certificate"]) if !params["certificate"].empty?

  @saml_response = response_generator.saml_response(name_id)
  erb :"go.html"
end
