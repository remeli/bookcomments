set :application, "twolitra"

set :scm, :git
set :repository,  "git://github.com/remeli/bookcomments.git"

set :user, "hosting_lagox"
set :use_sudo, false
set :deploy_to, "/home/#{user}/projects/#{application}"


role :web, "lithium.locum.ru"   # Your HTTP server, Apache/etc
role :app, "lithium.locum.ru"   # This may be the same as your `Web` server
role :db,  "lithium.locum.ru", :primary => true # This is where Rails migrations will run
set :deploy_via, :remote_cache

# shared database
after "deploy:update_code", :copy_database_config
task :copy_database_config, roles => :app do
 db_config = "#{shared_path}/database.yml"
 run "cp #{db_config} #{release_path}/config/database.yml"
end

# paperclip
after "deploy:update_code", :symlink_shared
task :symlink_shared, roles => :app do
  run "ln -nfs #{shared_path}/system #{release_path}/public/system"
end

#assets
# after "deploy:bundle_gems", "assets:compile"
# namespace :assets do
#   desc "Assets compile"
#   task :compile, roles => :app do
#     run "cd #{deploy_to}/current && rvm use 1.9.3 do bundle exec rake assets:precompile RAILS_ENV=production"
#   end
# end

set :unicorn_conf, "/etc/unicorn/twolitra.lagox.rb"
set :unicorn_pid, "/var/run/unicorn/twolitra.lagox.pid"
set :unicorn_start_cmd, "rvm use 1.9.3 do bundle exec unicorn_rails -Dc #{unicorn_conf}"


after "deploy", "deploy:bundle_gems"
after "deploy:bundle_gems", "deploy:restart"

namespace :deploy do
  desc "Bundle install"
  task :bundle_gems, :roles => :app do
    run "cd #{deploy_to}/current && rvm use 1.9.3 do bundle install --path ../../shared/gems"
  end
  
  desc "Start application"
  task :start, :roles => :app do
    run "cd #{current_path} && #{unicorn_start_cmd}"
  end

  desc "Stop application"
  task :stop, :roles => :app do
    run "[ -f #{unicorn_pid} ] && kill -QUIT `cat #{unicorn_pid}`"
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "[ -f #{unicorn_pid} ] && kill -USR2 `cat #{unicorn_pid}` || cd #{current_path} #{unicorn_start_cmd}"
  end
end