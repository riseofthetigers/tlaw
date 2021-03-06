require 'open-uri'
require 'json'
require 'addressable'

# Let no one know! But they in Ruby committee just too long to add
# something like this to the language.
#
# See also https://bugs.ruby-lang.org/issues/12760
#
# @private
class Object
  def derp
    yield self
  end
end

# TLAW is a framework for creating API wrappers for get-only APIs (like
# weather, geonames and so on) or subsets of APIs (like getting data from
# Twitter).
#
# Short example:
#
# ```ruby
# # Definition:
# class OpenWeatherMap < TLAW::API
#   param :appid, required: true
#
#   namespace :current, '/weather' do
#     endpoint :city, '?q={city}{,country_code}' do
#       param :city, required: true
#     end
#   end
# end
#
# # Usage:
# api = OpenWeatherMap.new(appid: '<yourappid>')
# api.current.weather('Kharkiv')
# # => {"weather.main"=>"Clear",
# #  "weather.description"=>"clear sky",
# #  "main.temp"=>8,
# #  "main.pressure"=>1016,
# #  "main.humidity"=>81,
# #  "dt"=>2016-09-19 08:30:00 +0300,
# #  ...}
#
# ```
#
# Refer to [README](./file/README.md) for reasoning about why you need it and links to
# more detailed demos, or start reading YARD docs from {API} and {DSL}
# modules.
module TLAW
end

require_relative 'tlaw/util'
require_relative 'tlaw/data_table'

require_relative 'tlaw/param'
require_relative 'tlaw/param_set'

require_relative 'tlaw/api_path'
require_relative 'tlaw/endpoint'
require_relative 'tlaw/namespace'
require_relative 'tlaw/api'

require_relative 'tlaw/response_processor'

require_relative 'tlaw/dsl'
