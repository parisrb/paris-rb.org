# Paris.rb

## Mac - Installation Instructions (using Rvm)

1) brew install postgresql
2) brew install redis
3) brew install mysql
4) brew services start postgresql
5) brew services start redis
6) brew services start mysql
7) install rvm and rails through ... rvm website.
8) ```rvm install 2.3.3```
9) git clone *thisreponame*
10) ```cd *thisreponame*```
11) ```bundle install```
12) rails s

## After Install, consider: Deploying to Heroku(Rvm must be 2.3.3 or greater)
1) brew install heroku
2) heroku login 
3) heroku create
4) git push heroku master
5) heroku rake db:migrate
6) need to add Redis To Go add on via heroku dashboard.
7) <br><pre>https://dashboard.heroku.com/apps -> yourappname -> ResourcesTab -> find_more_addons -> install Redis To Go</pre>
8) git commit --amend
9) git push heroku master --force-with-lease
