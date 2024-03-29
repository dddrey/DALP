# config valid for current version and patch releases of Capistrano
lock '~> 3.14.1'

set :application, 'DALP'
set :repo_url, 'git@github.com:dddrey/DALP.git'

set :rbenv_map_bins, %w(rake gem bundle ruby rails)

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/EE
set :deploy_to, "/home/deploy/#{fetch :application}"

set :keep_releases, 5

# Default value for :linked_files is []
append :linked_files, 'config/master.key'

# Default value for linked_dirs is []
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', '.bundle', 'public/system', 'public/uploads'

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for default_env is {}
# set :default_env, { path: '/opt/ruby/bin:$PATH' }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

# namespace :deploy do
#   desc 'Seed the database'
#   task :seed_db do
#     on roles(:db) do
#       within release_path do
#         execute :rake, 'db:seed'
#       end
#     end
#   end
# end

# # Seed the database
# after 'deploy:migrate', 'deploy:seed_db'
# before 'deploy:restart', 'sitemap:refresh'
