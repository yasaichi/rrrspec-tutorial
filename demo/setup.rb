require "open3"
require "pathname"

def execute(command)
  length = command.split("\n").map(&:length).max
  puts ["=" * length, command, "=" * length]

  Open3.popen3(command) do |stdin, stdout|
    stdin.close
    stdout.each { |line| puts line }
  end
end

roots = { project: Pathname.new("../../").expand_path(__FILE__) }
%i(client demo server).each { |dirname| roots[dirname] = roots[:project].join(dirname.to_s) }

# Install libraries
execute <<EOS
gem install foreman
cd #{roots[:client]} && bundle install
cd #{roots[:server]} && bundle install
EOS

# Create demo/.env
env_path = roots[:demo].join(".env")
File.write(env_path, <<EOS)
# For all
RRRSPEC_REDIS_HOST="localhost"

# For Master
RRRSPEC_ENV="development"

# For Client and Worker
RRRSPEC_RSYNC_REMOTE_PATH="#{roots[:server].join("tmp/rrrspec-rsync")}"
EOS

# Run migrations
execute <<EOS
cd #{roots[:server]}
foreman run --env=#{env_path} bundle exec rake rrrspec:server:db:create rrrspec:server:db:migrate
EOS
