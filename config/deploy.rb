# У вас должна быть настроена авторизация ssh по сертификатам

set :application, "litra"

# настройка системы контроля версий и репозитария, по умолчанию - git, если используется иная система версий, нужно изменить значение scm
set :scm, :git
set :repository,  "git://github.com/remeli/bookcomments.git"

set :user, "hosting_lagox"
set :use_sudo, false
set :deploy_to, "/home/hosting_lagox/projects/litra"


role :web, "lithium.locum.ru"   # Your HTTP server, Apache/etc
role :app, "lithium.locum.ru"   # This may be the same as your `Web` server
role :db,  "lithium.locum.ru", :primary => true # This is where Rails migrations will run

# эта секция для того, чтобы вы не хранили доступ к базе в системе контроля версий. Поместите dayabase.yml в shared,
# чтобы он копировался в нужный путь при каждом выкладывании новой версии кода
# так лучше с точки зрения безопасности, но если не хотите - прсото закомментируйте этот таск


# Если хотите поместить конфиг в shared и не хранить его в системе контроя версий - раскомментируйте следующие строки

after "deploy:update_code", :copy_database_config

task :copy_database_config, roles => :app do
 db_config = "#{shared_path}/database.yml"
 run "cp #{db_config} #{release_path}/config/database.yml"
end

#paperclip
task :symlink_shared, roles => :app do
  run "ln -nfs #{shared_path}/system #{release_path}/public/system"
end
after "deploy:update_code", :symlink_shared



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