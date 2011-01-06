set :stages, %w(staging production)
set :default_stage, "staging"
require 'capistrano/ext/multistage'

set :application, "ecomap"
set :application_root, "/var/www/html/#{application}"

set :scm, :git
set :repository,  "git://github.com/asux/ecomap.git"
set :branch, "master"
set :scm_verbose, true
set :deploy_via, :remote_cache

set :keep_releases, 5

set :user, "gramota"
set :port, 777
set :ssh_options, {:forward_agent => true, :auth_methods => ["publickey"]}
default_run_options[:pty] = true

set :chmod755, %w(app config db lib public vendor script tmp public/dispatch.cgi public/dispatch.fcgi public/dispatch.rb)
set :use_sudo, false

role :web, "ecomap.dikins.org.ua"                          # Your HTTP server, Apache/etc
role :app, "ecomap.dikins.org.ua"                          # This may be the same as your `Web` server
role :db,  "ecomap.dikins.org.ua", :primary => true # This is where Rails migrations will run

depend :local, :command, "git"
depend :remote, :command, "bundle"
depend :remote, :command, "rake"
depend :remote, :command, "rails"

namespace :deploy do
  desc "Do nothing"
  task :start do ; end

  desc "Do nothing"
  task :stop do ; end

  desc "Tell Passenger to restart appliation"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  desc "Push changesets to remote repository dir"
  task :git_push do
    cmd = "git --work-tree=#{File.expand_path(".")} push origin"
    puts cmd
    system cmd
  end

  desc "Set the proper permissions for directories and files.  Specify a
        list of folders and files with `set :chmod755` in config/deploy.rb"
  task :set_perms, :roles => [:app, :db, :web] do
    run(chmod755.collect { |i| "chmod 755 #{current_path}/#{i}" }.join(" && "))
  end

  #desc "Symlink shared attachments folder on each release."
  #task :symlink_attachments do
  #  run "rm -rf #{release_path}/public/attachments && ln -nfs #{shared_path}/attachments #{release_path}/public/attachments"
  #end

  desc "Symlink cache folder on each release."
  task :symlink_cache do
    run "rm -rf #{release_path}/tmp/cache && ln -nfs #{shared_path}/cache #{release_path}/tmp/cache"
  end
  
  desc "Symlink bundle folder on each release."
  task :symlink_bundle do
    run "rm -rf #{release_path}/vendor/bundle && ln -nfs #{shared_path}/bundle #{release_path}/vendor/bundle"
  end

  desc "Bundle install"
  task :bundle do
    sudo "bundle install --gemfile=#{current_path}/Gemfile --without=development,test --deployment" do |channel, stream, data|
      puts data if stream == :out
      if stream == :err
        puts "[Error: #{channel[:host]}] #{data}"
        break
      end
    end
  end
end

namespace :rake do
  desc "Run rake test on remote"
  task :run_test do
    rake "test"
  end

  desc "Run rake spec on remote"
  task :run_spec do
    rake "spec"
  end
end

namespace :log do
  desc "Watch server log"
  task :watch do
    run "tail -f #{current_path}/log/#{rails_env}.log" do |channel, stream, data|
      puts data if stream == :out
      if stream == :err
        puts "[Error: #{channel[:host]}] #{data}"
        break
      end
    end
  end
end

before "deploy:update", "deploy:git_push"
#after "deploy:symlink", "deploy:symlink_attachments"
after "deploy:symlink", "deploy:symlink_cache"
after "deploy:symlink", "deploy:symlink_bundle"
#after "deploy:symlink", "deploy:set_perms"
after "deploy", "deploy:cleanup"
