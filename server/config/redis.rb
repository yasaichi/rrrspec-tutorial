RRRSpec.configure do |config|
  config.redis = {
    host: ENV["RRRSPEC_REDIS_HOST"],
    port: 6379
  }
end
