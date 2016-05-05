require_relative "redis"

env = ENV["RRRSPEC_ENV"] || "development"
root = Pathname.new("../..").expand_path(__FILE__)
db_config = YAML.load(ERB.new(File.read(root.join("config/database.yml"))).result)

ActiveRecord::Base.default_timezone = :local

%i(server web).each do |type|
  RRRSpec.configure(type) do |config|
    config.persistence_db = db_config[env].symbolize_keys
    config.execute_log_text_path = root.join("tmp/rrrspec-log-texts")
  end
end

RRRSpec.configure(:server) do |config|
  config.pidfile = root.join("tmp/pids/rrrspec-master.pid")
end
