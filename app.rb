# frozen_string_literal: true
#
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('Gemfile', __dir__)

require 'sinatra'
require 'sinatra/contrib'
require 'logger'

set :logger, Logger.new(STDOUT)

route :get, :post, :delete, :put, :patch, '/*/?' do
  content_type 'application/json'

  logger.info "#{request.request_method} method - params: #{params}"
  logger.info "#{request.body.read}"
  {
    body: request.body.read,
    query_string: request.query_string,
    headers: headers,
    params: params,
    request_method: request.request_method
  }.to_json
end
