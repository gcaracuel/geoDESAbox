	
#!/usr/bin/env bash

# Get root up in here
sudo su

# Just a simple way of checking if you we need to install everything
if [ ! -d "/var/tmp/geoDESArequirements" ]
then
    # Add mongo to apt
    apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
    echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/10gen.list

    # Add Chris Lea's Node repo
    apt-key adv --keyserver keyserver.ubuntu.com --recv C7917B12
    echo 'deb http://ppa.launchpad.net/chris-lea/node.js/ubuntu precise main' | sudo tee /etc/apt/sources.list.d/node.list

    # Update and begin installing some utility tools
    apt-get -y update

    apt-get install -y python-software-properties
    apt-get install -y vim git curl unzip
    apt-get install -y memcached build-essential

    # Visit https://launchpad.net/~chris-lea/+archive/node.js for update
    apt-get install -y nodejs=0.10.22-1chl1~precise1

    # Install npm
    curl https://npmjs.org/install.sh | sh
    
    # Install latest stable version of mongo
    apt-get install mongodb-10gen

    # Symlink our host www to the guest /var/www folder
    ln -s /vagrant/www /var/www

    touch /var/tmp/geoDESArequirements

    echo "#####################################"
    echo ""
    echo "geoDESA requirements are ready. Now get de code!"
    echo ""
    echo "#####################################"
fi


	# Clone geoDESA repo from Github
	cd /var/www/
	git clone https://github.com/truki/geoDESA.git



    #### Descargamos testdata de collections e importamos cada una de ellas
    #wget https://raw.github.com/gcaracuel/geoDESABox/master/testdata.json --quiet
    #mongoimport --db <aqui db> --colletion <aqui collection>
    #rm testdata.json


    cd /var/www/geoDESA
    # Install node modules
    sudo npm install -g

    echo ""
    echo ""
    echo ""
    echo "#####################################"
    echo ""
    echo "geoDESA is prepared, let's start it!"
    echo ""
    echo "#####################################"

	# Run it
    node /var/www/geoDESA/app.js
