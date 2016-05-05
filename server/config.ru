ENV["RACK_ENV"] = ENV["RRRSPEC_ENV"]

require "bundler/setup"
require "rrrspec/web"
require_relative "config/master"

RRRSpec::Web.setup
run Rack::Cascade.new([RRRSpec::Web::APIv2, RRRSpec::Web::App])
