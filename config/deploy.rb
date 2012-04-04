set :application, "TwitRL"
set :repository,  "https://ryonext@github.com/ryonext/TwitRL.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "192.168.0.30", :user=>'ryonext'                          # Your HTTP server, Apache/etc
role :app, "192.168.0.30", :user=>'ryonext'                          # This may be the same as your `Web` server
role :db,  "192.168.0.30", :primary => true, :user=>'ryonext' # This is where Rails migrations will run
#role :db,  "your slave db-server here"

set :deploy_to, "/var/www/apps/TwitRL/production"
set :deploy_via, :copy

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
