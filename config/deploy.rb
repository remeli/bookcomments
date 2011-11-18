set :application, "litra"

role :web, "lithium.locum.ru"   # Your HTTP server, Apache/etc
role :app, "lithium.locum.ru"   # This may be the same as your `Web` server
role :db,  "lithium.locum.ru", :primary => true # This is where Rails migrations will run

set :user, "hosting_lagox"
set :use_sudo, false
set :rack_env, 'production'
set :rake, 'rake'

set :scm, :git
set :deploy_to, "/home/hosting_lagox/projects/litra"
set :repository,  "git://github.com/remeli/bookcomments.git"
set :branch, 'master'
set :bundle_gemfile, 'Gemfile'
set :bundle_dir, 'vendor/gems'
set :bundle_flags, '--deployment --quiet'
set :bundle_without, [ :development, :test ]
set :bundle_cmd, "RAILS_ENV=production rvm use ree-1.8.7 do bundle"

after "deploy:update_code", :copy_database_config

task :copy_database_config, roles => :app do
 db_config = "#{shared_path}/database.yml"
 run "cp #{db_config} #{release_path}/config/database.yml"
end

after "deploy:update_code", :symlink_shared
#paperclip
task :symlink_shared, roles => :app do
  run "ln -nfs #{shared_path}/system #{release_path}/public/system"
end

set :unicorn_conf, "/etc/unicorn/litra.lagox.rb"
set :unicorn_pid, "/var/run/unicorn/litra.lagox.pid"

  set :unicorn_start_cmd, "rvm use ree-1.8.7 do bundle exec unicorn_rails -Dc #{unicorn_conf}"


# - for unicorn - #
namespace :deploy do
  desc "Start application"
  task :start, :roles => :app do
    run unicorn_start_cmd
  end

  desc "Stop application"
  task :stop, :roles => :app do
    run "[ -f #{unicorn_pid} ] && kill -QUIT `cat #{unicorn_pid}`"
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "[ -f #{unicorn_pid} ] && kill -USR2 `cat #{unicorn_pid}` || #{unicorn_start_cmd}"
  end
end

namespace :assets do
  desc 'Compile all the assets named in config.assets.precompile'
  task :precompile do
    run "cd #{current_path} && #{bundle_cmd} exec #{rake} assets:precompile"
  end

  desc 'Remove compiled assets'
  task :clean do
    run "cd #{current_path} && #{bundle_cmd} exec #{rake} assets:clean"
  end
end

after "deploy:update_code", :'assets:precompile'
