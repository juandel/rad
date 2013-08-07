# Load RVM's capistrano plugin.    
require "rvm/capistrano"

set :rvm_bin_path, '/usr/local/rvm/bin'
set :rvm_ruby_string, 'ruby-2.0.0-p0'
set :rvm_type, :system  # Don't use system-wide RVM

# App information

set :application, "rad"
set :scm, 'git'
set :repository,  "git@github.com:octanko/rad.git"

set :user, 'rad'
set :use_sudo, false
set :deploy_to, "/var/www/#{application}"
set :deploy_via, :remote_cache

$:.unshift(File.expand_path('./lib', ENV['rvm_path']))

server "74.208.90.50", :web, :app, :db, primary: true

ssh_options[:forward_agent] = true
default_run_options[:pty] = true

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

after "deploy", "deploy:bundle_gems"
after "deploy:bundle_gems", "deploy:restart"

namespace :deploy do
   task :bundle_gems do
    run "cd #{deploy_to}/current && bundle install vendor/gems"
   end
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "touch #{File.join(current_path,'tmp','restart.txt')}"
   end
 end