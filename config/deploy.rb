# which rake
#set :rake,  "/usr/local/rvm/gems/ruby-1.9.2-p290/bin/rake"
# # RVM bootstrap
#$:.unshift(File.expand_path('./lib', ENV['rvm_path']))

#require 'rvm/capistrano'
#set :rvm_ruby_string, '1.9.2'
#set :rvm_type, :system

# # bundler bootstrap
#require 'bundler/capistrano'


# APP SETTINGS
set :application, "project_manager"
set :ip_address , "177.70.3.218"

# GIT SETTINGS
set :scm, :git
set :repository,  "git@github.com:ernane/project_manager.git"
set :branch, "master"
set :deploy_via, :remote_cache

# SSH SETTINGS
set :user , "talentom"
set :deploy_to, "/home/talentom/rails_apps/#{application}"
set :shared_directory, "#{deploy_to}/shared"
set :use_sudo, false
set :group_writable, false
default_run_options[:pty] = true

# ROLES
role :app, ip_address
role :web, ip_address
role :db,  ip_address, :primary => true

# HOOKS
after 'deploy:update_code' do
  db.symlink_extras
  assets.assets
end

# TASKS
namespace :deploy do
  # Restart passenger on deploy
  desc "Restarting mod_rails with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end

  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do ; end
  end
end

namespace :db do
  desc "link database.yml and mail_settings.rb"
  task :symlink_extras do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/config/mail_settings.rb #{release_path}/config/initializers/mail_settings.rb"
  end

  desc "seed database"
  task :seed do
    run "cd #{current_path} && rake db:seed RAILS_ENV=production"
  end

  desc "Setup shared directory."
  task :setup_shared do
    run "mkdir #{shared_path}/config"
    puts "Now edit the config files and fill assets folder in #{shared_path}."
  end
end

namespace :assets do
  # task :symlink_extras, :roles => :app do
  #    assets.create_dir
  #    run <<-CMD
  #    rm -rf  #{current_path}/public/system &&
  #    ln -nfs #{shared_path}/system #{release_path}/public/system
  #    CMD
  #  end
  #
  #  task :create_dir, :roles => :app do
  #    run "test -d #{shared_path}/system || mkdir -p #{shared_path}/system"
  #  end

  desc "assets_precompile"
  task :assets do
    #run "cd #{current_path}; RAILS_ENV=production rake assets:precompile"
  end
end

after "deploy", "deploy:cleanup" # keeps only last 5 releases
after "deploy:setup", "deploy:setup_shared"
after "deploy", "deploy:update_code"
