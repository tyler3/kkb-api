# config valid for current version and patch releases of Capistrano
lock "~> 3.19.2"

set :application, "kkb-api"
set :repo_url, "git@github.com:tyler3/kkb-api.git"

set :branch, 'main'

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/var/rails/kkb-api"
set :puma_conf, "#{current_path}/config/puma.rb"
set :puma_bind, "unix:/var/rails/kkb-api/shared/tmp/sockets/puma.sock"
set :puma_state, "/var/rails/kkb-api/shared/tmp/pids/puma.state"
set :puma_pid, "/var/rails/kkb-api/shared/tmp/pids/server.pid"
set :puma_service_unit_name, "puma.service"
set :puma_systemctl_user, :system
append :linked_files, "config/master.key", "config/database.yml"

set :ssh_options, {
  keys: [File.expand_path('~/weedsaws.pem')],
  forward_agent: true,
  auth_methods: %w(publickey)
}

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end

namespace :db do
  task :menu do
    on roles(:db) do
      within current_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, 'db:menu'
        end
      end
    end
  end
end

namespace :config do
  task :display do
    Capistrano::Configuration.env.keys.each do |key|
      p "#{key} => #{fetch(key)}"
    end
  end
end