#How to setup intengo with Vagrant.
1. Set the PROJECT_NAME in the vagrant file and in the install.sh script ( make sure it doesnt conflict with any preexisting db names or directories )
2. Run the post-install.sh script
3. Ensure that the app/storage directory is writeable ( do this from the client, not Vagrant )
4. Make sure redis-server is on
5. Run artisan migrate to setup the database and schema, then seed it

##If you experience problems:
* Ensure the permissions on app/storage are right again
* re run composer install
* make sure host file and vhost are setup correctly
* make sure that sudo ipfw list shows the correct ports.

#Resources
# https://raw.github.com/laracasts/Vagrant-Setup/master/install.sh
# https://github.com/duellsy/Laravel-4-Vagrant/blob/master/bootstrap.sh