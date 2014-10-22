# Environment Setup

Before anything do this:

- Install Xcode
- Install Xcode command line tools (preferences > downloads) **Note: Don't install Ruby 1.9.3 before doing this, you might run into problems :(**

```bash
xcode-select --install
```

### Shell
Install [zshell](https://github.com/robbyrussell/oh-my-zsh)

### Ruby & Rails Installtion Using Homebrew & RVM
- Install [Homebrew](http://brew.sh/) and verify installation:
```bash
brew doctor
```
- Install [RVM](http://rvm.io/rvm/install) and verify installation:
```bash
rvm requirements
```
- Start Installing Rubies using:
```bash
rvm install <ruby version>
```
- Install Rails amd verify installation
```bash
gem install rails
rails -v
```

**Resources:**
- http://dean.io/setting-up-a-ruby-on-rails-development-environment-on-mavericks/
- https://gorails.com/setup/osx/10.9-mavericks
- http://jeffcohenonline.com/installing-rails
- http://www.createdbypete.com/articles/ruby-on-rails-development-setup-for-mac-osx/ (Uses rbenv, not rvm)
- http://www.computersnyou.com/2673/2013/10/install-ruby-rails-macos-x-mavericks-10-9-mysql-step-step/
- http://mattzago.com/blog/2013/11/16/installing-rvm-on-mavericks
- **http://lapwinglabs.com/blog/hacker-guide-to-setting-up-your-mac**

### Setup Github

- [Follow this Github Guide](https://help.github.com/articles/generating-ssh-keys)

```bash
ssh-keygen -t rsa -C <email>

#copy ssh key to github.com
subl ~/.ssh/id_rsa.pub

#test connection
ssh -T git@github.com

#set git config values
git config --global user.name <naem>
git config --global user.email <email>
git config --global github.user <username>
git config --global github.token <token>

git config --global core.editor "subl -w"
git config --global color.ui true
```

If you have issues authenticating after setting up SSH keys, it's likely because you have two-factor authentication enabled. [This blog post](http://olivierlacan.com/posts/why-is-git-https-not-working-on-github/) will help make things right (create and add an Oauth token in the Github admin).

**Other Resources**
- [Set up Git](https://help.github.com/articles/set-up-git)
- [Caching your Github password in git](https://help.github.com/articles/caching-your-github-password-in-git)

### Setup Heroku Toolbelt

https://toolbelt.heroku.com/

### Install Sublime Text

- Import Preferences
- Install Fonts
- Import Custom Theme
- Install Packages ([link](https://sublime.wbond.net/installation))

### Postgres Installation
```bash
brew install postgresql
```

And don't forget to update preferences

Alternatively, use the [Postgres app](http://postgresapp.com/)

- https://www.digitalocean.com/community/tutorials/how-to-setup-ruby-on-rails-with-postgres
- http://www.moncefbelyamani.com/how-to-install-postgresql-on-a-mac-with-homebrew-and-lunchy/
- https://www.codefellows.org/blog/how-to-install-postgresql

### Mysql Installation
```bash
brew install mysql
```

- http://blog.joefallon.net/2013/10/install-mysql-on-mac-osx-using-homebrew/
- http://dev.mysql.com/doc/refman/5.0/en/macosx-installation.html

### SQLite3 Installation

```bash
brew install sqlite
```

http://www.sqlite.org/download.html

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

Inspired by this awesome environment setup guide: https://gist.github.com/g3d/2709563
