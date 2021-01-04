server 'my-server', user: 'deploy', roles: %w{app db web}
set :user, 'deploy'
set :stage, 'prod'
set :deploy_to, '/home/deploy/hotwiew'
set :rails_env, 'production'
set :ssh_options, {
  forward_agent: true
}
append :linked_files, 'config/database.yml', 'config/schedule.rb', "config/credentials/#{fetch(:rails_env)}.key", 'config/sidekiq.yml'
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads', 'public/packs'
set :sidekiq_queue, ['default']
set :sidekiq_concurrency, 1

# restart passenger
namespace :deploy do
  desc 'Restart your Passenger application'
  task :restart do
    invoke('passenger:restart')
  end
  after :publishing, :'deploy:restart'
end
