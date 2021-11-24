sudo apt install rbenv
rbenv init

git clone https://github.com/rbenv/ruby-build.git
PREFIX=/usr/local ./ruby-build/install.sh

curl -fsSL https://github.com/rbenv/rbenv-installer/raw/main/bin/rbenv-doctor | bash

rbenv install 2.6.0                  # installs Ruby 2.2.0 to ~/.rbenv/versions
rbenv local 2.6.0  # rbenv global 2.0.0-p247 or
# As an rbenv plugin
rbenv install --list                 # lists all available versions of Ruby

gem install bundler

bundle install
bundle exec jekyll serve
view-source:https://people.csail.mit.edu/liyunzhu

https://www.w3schools.com/bootstrap/bootstrap_grid_examples.asp

https://www.taniarascia.com/make-a-static-website-with-jekyll/
https://www.w3schools.com/html/html_examples.asp
# video play with js
https://www.w3schools.com/tags/tryit.asp?filename=tryhtml5_av_prop_autoplay
https://stackoverflow.com/questions/25107514/bootstrap-different-input-size-different-screen-size
