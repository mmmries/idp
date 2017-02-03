require "bundler/setup"
require "sinatra"
require "ruby-saml-idp"

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
  response_generator = ::ResponseGenerator.new(@sp_url)
  @saml_response = response_generator.saml_response(name_id)
  erb :"go.html"
end
