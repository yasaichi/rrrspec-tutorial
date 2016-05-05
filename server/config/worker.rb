require_relative "redis"

root = Pathname.new("../..").expand_path(__FILE__)

RRRSpec.configure(:worker) do |config|
  config.pidfile = root.join("tmp/pids/rrrspec-worker.pid")

  config.rsync_remote_path = ENV["RRRSPEC_RSYNC_REMOTE_PATH"]
  config.rsync_options = %w(
    --compress
    --times
    --recursive
    --links
    --perms
    --inplace
    --delete
  ).join(" ")

  config.working_dir = root.join("tmp/rrrspec-working").to_s
  config.worker_type = "default"
end
