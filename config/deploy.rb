# config valid for current version and patch releases of Capistrano
lock "~> 3.14.1"

set :application, "hotwire"
set :repo_url, "git@github.com:willyjie23/hotwire.git"
set :deploy_to, "/home/deploy/#{fetch :application}"
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', '.bundle', 'public/system', 'public/uploads'
set :keep_releases, 5
