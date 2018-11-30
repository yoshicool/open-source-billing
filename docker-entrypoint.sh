#!/bin/bash -x

while ! mysqladmin ping -h "database" --silent; do
	echo "Waiting for DB..."
	sleep 3
done

cd /usr/src/osb

source /etc/profile.d/rvm.sh 
if [ ! -e /configured ]; then
	rake db:create
	rake db:migrate
	rake db:seed
	touch /configured
fi

RAILS_ENV=development  bin/delayed_job start
rails server
