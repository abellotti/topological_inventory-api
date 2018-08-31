=begin
Topological Inventory

Topological Inventory

OpenAPI spec version: 0.0.1
Contact: you@your-company.com
Generated by: https://github.com/swagger-api/swagger-codegen.git

=end

require 'rest_client'
require 'json'

class ServiceParametersSet
  def initialize(options = {})
    @id          = options['id']
    @href        = options['href']
    @name        = options['name']
    @description = options['description']
    @ems_ref     = options['ems_ref']
    @extra       = options['extra']
  end

  def self.all
    get_response(service_parameters_sets_url)['resources'].collect { |r| new(r) }
  end

  def self.service_parameters_sets_url
    URI.join(api_url, "service_parameters_sets?expand=resources").to_s
  end

  def self.api_url
    "http://localhost:3000/api/"
  end

  def self.get_response(url)
    result = RestClient::Request.new(
      :method     => :get,
      :url        => url,
      :user       => "admin",
      :password   => "smartvm",
      :verify_ssl => false
    ).execute
    JSON.parse(result.body)
  end
end
