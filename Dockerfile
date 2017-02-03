FROM ruby:2.4.0-alpine

ADD . .
RUN bundle install
CMD ruby idp.rb -p 80 -o 0.0.0.0
