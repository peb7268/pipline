require 'capistrano/ext/multistage'
set :application, "ICE"

set :stages, ["staging", "production"]
set :default_stage, "production"

#see http://stackoverflow.com/questions/14253913/capistrano-deploy-from-git-http-repo
set :scm, :git
set :repository, "https://pursual:ToneBone1@github.com/Infosurv/icev2.git"
#set :scm_passphrase, "ToneBone1"

set :user, "deployment"
set :password, "Deploy*"
#set :use_sudo, false
set :sudo_password, "Deploy*"
default_run_options[:pty] = true

#server "intengoresearch.com", :app, :web, :db, :primary => true
#set :deploy_to, "/var/www/intengoresearch.com"

after "deploy:create_symlink", "deploy:cleanup"

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :cleanup, :roles => :app, :except => { :no_release => true } do
	run "chmod -R 777 #{deploy_to}/#{current_dir}/app/storage"
	# remove some junk files
	run "rm -f #{deploy_to}/#{current_dir}/app/storage/sessions/*"
	run "rm -f #{deploy_to}/#{current_dir}/app/storage/cache/*"
	run "rm -f #{deploy_to}/#{current_dir}/app/storage/views/*"

	run "#{deploy_to}/composer install -d #{deploy_to}/#{current_dir}"
  end
end
