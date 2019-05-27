
# README

* Ruby version: ruby 2.6.1p33

* Rails version: Rails 5.2.3

* System dependencies:
	* imagemagick: brew install imagemagick
	* sqlite3: brew install sqlite3


* Configuration:
	* make sure you have correct master.key in config/

* Database creation:
	* rake db:create

* Database initialization:
	* rake db:migrate

* Deployment instructions:
	*	git clone project
	*	bundle install
	*	put master.key to config/
	*	create a user by Rails console
	*	rails s
