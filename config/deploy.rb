# config valid for current version and patch releases of Capistrano
lock "~> 3.16.0"

set :application, 'hotwire'
set :repo_url, 'git@github.com:willyjie23/hotwire.git'

# Deploy to the user's home directory
set :deploy_to, "/home/deploy/#{fetch :application}"

append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', '.bundle', 'public/system', 'public/uploads', 'assets/javascripts/libraries'

# Only keep the last 5 releases to save disk space
set :keep_releases, 5