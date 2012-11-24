# What's this
It consists on fetching a json from http://api.ihackernews.com/, calculate some statistics (mean, median and mode) and send them by email.

# Requeriments
It was developed using ruby 1.8.7, json and tlsmail gems are required. By default, it's using always the same email recipient and sender. You can change this by editing mail_conf.rb file.

# How to run it
To run it, just type: ruby main.rb

# Unit testing
To run tests, just type: ruby array_extension.rb and ruby hacker_news.rb.
