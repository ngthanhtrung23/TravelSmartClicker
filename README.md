Installation on Mac
==================

rbenv

```
brew install rbenv ruby-build
Add this to your ~/.bashrc:  eval "$(rbenv init -)"
source ~/.bashrc
rbenv install 2.1.2
rbenv rehash
cd <path to repo>
gem install bundler
rbenv rehash
bundle install
rbenv rehash
```

To Run
==================

Change email & password in clicker.rb

In command line, run

```
rspec ./clicker.rb
```
