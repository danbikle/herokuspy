# herokuspy

I present this repository, herokuspy, to the Python Meetup 2016-01-18:

http://www.meetup.com/BayPIGgies/events/227481217

The herokuspy repository depends on the pyspy repository.

I always install pyspy before I install herokuspy.

It is easy to install pyspy, the repository is at this URL:

https://github.com/danbikle/pyspy

The herokuspy repository is an enhancement of the repository listed below:

https://github.com/heroku/python-getting-started

I like to install herokuspy into this folder:

/home/ann/herokuspy

You could try to install it elsewhere.

Anyway, I do this:

```
cd ~
git clone https://github.com/danbikle/herokuspy
```

Next, I install the Heroku Toolbelt:

```
cd ~
rm -rf heroku-client.tgz heroku-client
wget https://s3.amazonaws.com/assets.heroku.com/heroku-client/heroku-client.tgz
tar zxf heroku-client.tgz
echo 'export PATH=/home/ann/heroku-client/bin:${PATH}' >> ~/.bashrc
bash
```

Then, I create an ssh-key for ann account (assuming ann has none yet).

```
ssh-keygen -t rsa
```

Next, I navigate to heroku.com and create an account via the web-ui.

Then, I return to the shell and give copy of ann public ssh-key to heroku:

```
cd ~/herokuspy
~/heroku-client/bin/heroku status
~/heroku-client/bin/heroku auth:login
~/heroku-client/bin/heroku auth:whoami
~/heroku-client/bin/heroku keys:add
``` 

Also, in my local Ubuntu host, I create an ann account in Postgres:

```
cd ~/herokuspy
sudo su - postgres
psql
CREATE ROLE ann WITH superuser login;
CREATE DATABASE ann;
\q
exit
```
 
At this point I should be able to create an app on heroku:

```
cd ~/herokuspy
~/heroku-client/bin/heroku create hspy10
```

You will need to use a different app name than hspy10.

Perhaps hspy11 is available?

I use git to deploy the app to heroku:

```
git push heroku master
~/heroku-client/bin/heroku run python manage.py migrate
```

I should be able to see my app with a browser:

https://hspy10.herokuapp.com/


If I can see my app run on heroku, I should try to run it locally in my Ubuntu host.

I start this effort by running some shell commands:

```
cd ~/herokuspy
~/anaconda3/bin/pippip install -r requirements.txt
/usr/bin/createdb python_getting_started
~/heroku-client/bin/heroku local:run python manage.py migrate
python manage.py collectstatic
~/heroku-client/bin/heroku local
```

My app should now be accepting requests at this URL:

http://localhost:5000

# Operation

I operate herokuspy in two different modes.

First, I run a script at 12:50pm Mon-Fri California time which relies on pyspy to observe the current price of the S&P 500 index.

Next, the script uses this new observation to generate the most recent prediction.

This prediction is published to the web so that users can act on it before the market closes at 13:00pm (16:00 NY time).

The script is listed below:

```
~/herokuspy/bin/noon50.bash
```

In the second mode I run a script at 21:00pm Mon-Fri California time which uses the closing price of the S&P 500 index to generate the most recent prediction.

This second script is listed below:

```
~/herokuspy/bin/night.bash
```

The content below was written by the developers at Heroku:
- - -
# python-getting-started

A barebones Python app, which can easily be deployed to Heroku.

This application support the [Getting Started with Python on Heroku](https://devcenter.heroku.com/articles/getting-started-with-python) article - check it out.

## Running Locally

Make sure you have Python [installed properly](http://install.python-guide.org).  Also, install the [Heroku Toolbelt](https://toolbelt.heroku.com/) and [Postgres](https://devcenter.heroku.com/articles/heroku-postgresql#local-setup).

```sh
$ git clone git@github.com:heroku/python-getting-started.git
$ cd python-getting-started
$ pip install -r requirements.txt
$ createdb python_getting_started
$ heroku local:run python manage.py migrate
$ python manage.py collectstatic
$ heroku local
```

Your app should now be running on [localhost:5000](http://localhost:5000/).

## Deploying to Heroku

```sh
$ heroku create
$ git push heroku master
$ heroku run python manage.py migrate
$ heroku open
```
or

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

## Documentation

For more information about using Python on Heroku, see these Dev Center articles:

- [Python on Heroku](https://devcenter.heroku.com/categories/python)
