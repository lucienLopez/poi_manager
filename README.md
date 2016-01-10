# Technical description #

+ [Ruby](http://ruby-lang.org), >= `2.0`
+ [Rails](http://rubyonrails.org), >= `4.2.1`
+ [PostgreSQL](http://www.postgresql.org), >= `9.3.5`
+ [Foundation](http://foundation.zurb.com)


# Installation #

We will not cover the process of installing Ruby, Rails, or PostgreSQL.

## Install dependancies ##

~~~sh
bundle install
~~~

## Database setup ##

For security reason, **postgreSQL** has disabled **trusted** connection, to enable it on Ubuntu, execute the following command as `root` :  
~~~sh
sudo find /etc/postgresql -type f -name pg_hba.conf -exec sed -i 's/peer/trust/g' {} \;
service postgresql restart
~~~

You then have to create the database:  
~~~sh
bundle exec rake db:create
bundle exec rake db:migrate
~~~

You can fill the database with random data if you want:  
~~~sh
bundle exec rake db:populate
~~~

# Run tests #

To run all tests, simply execute the following command:  
~~~sh
bundle exec rake test
~~~
