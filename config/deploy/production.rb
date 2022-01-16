server 'my-server', user: 'deploy', roles: %w{app db web}

set :branch, 'master'
set :rails_env, :production
set :pty, true
set :puma_systemctl_user, :user