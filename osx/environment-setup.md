# Environment Setup via Boxen

- Install Xcode
- Install Xcode command line tools (preferences > downloads)

### Setup using Homebrew & RVM**
- Install [Homebrew](http://brew.sh/)
- Verify Homebrew was installed properly using ``brew doctor``
- Install Ruby via [RVM](http://rvm.io/rvm/install)
- Verify Ruby and RVM was installed properly
- Install SQLlite
- Install Rails
- Verify Rails working properly
- Install Mysql
- Install Postgres
- Install [zshell](https://github.com/robbyrussell/oh-my-zsh)

**Resources:**
http://dean.io/setting-up-a-ruby-on-rails-development-environment-on-mavericks/
https://gorails.com/setup/osx/10.9-mavericks
http://jeffcohenonline.com/installing-rails
http://www.createdbypete.com/articles/ruby-on-rails-development-setup-for-mac-osx/ (Uses rbenv, not rvm)

### Postgres Installation
``brew install postgresql``

Alternatively, use the [Postgres app](http://postgresapp.com/)

**Resources:**
https://www.digitalocean.com/community/tutorials/how-to-setup-ruby-on-rails-with-postgres
http://www.moncefbelyamani.com/how-to-install-postgresql-on-a-mac-with-homebrew-and-lunchy/
https://www.codefellows.org/blog/how-to-install-postgresql

### Setup Using Boxen
Boxen might not play well with RVM or Homebrew. I've also had issues installing Postgres with it, there are workarounds to this like using the [Postgres app](http://postgresapp.com/). Visit the [Boxen Github Pages for a full setup guide](https://github.com/boxen/our-boxen)
Start by opening up terminal and copy-pasting in each of the following commands, hitting enter after each line:
``sudo mkdir -p /opt/boxen``
``sudo chown ${USER}:admin /opt/boxen``
``git clone https://github.com/boxen/our-boxen /opt/boxen/repo``
``cd /opt/boxen/repo``
``script/boxen --no-fde``
Edit your bash profile to let terminal access your Boxen installation. If your bash_profile does not exist, create one.
Paste the following line into your bash profile
``[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh``
This line is unrelated to hooking up Boxen, but will change your bash prompt to match what we use in class.
``export PS1="\w: "``
Restart terminal
Run the following command in terminal to set ruby to version 2.0.0 and update your gemset:
``rbenv global 2.0.0-p0``
``gem update --system``
Check if you are actually using Ruby vX.X.X by running the following command in terminal:
``ruby -v``
Run the following command in terminal to install rails, press 'y' to overwrite any documentation:
``gem install rails``
Check if Rails installed.
``rails -v``
