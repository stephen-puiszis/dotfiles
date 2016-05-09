# Clean Install / New Environment Setup

**Backup the following before doing anything**
- Chrome Bookmarks
- Dropbox / Spider Oak
- Email
- Music / iTunes [how to backup](https://discussions.apple.com/thread/4152079?start=0&tstart=0)
- iPhone 
- Contacts
- Messages
- Push any branches
- Export Wunderlist Tasks

# Environment Setup

**Before doing anything**:

- Install Xcode
- Install Xcode command line tools (preferences > downloads) **Note: Don't install Ruby 1.9.3 before doing this, you might run into problems :(**

```bash
xcode-select --install
```
### iTerm 2
- Install [iTerm2](http://iterm2.com/) and import preferences

### Install Homebrew
- Install [Homebrew](http://brew.sh/) and verify installation:
```bash
brew doctor
```

### Shell
- Install [zshell](https://github.com/robbyrussell/oh-my-zsh)
Setup `.zsh` scripts

### Install Git 
```bash
brew install git
git --version
```

Make sure you are using the version of Git you just installed. If you're not, you are probably using OSX Git and you should add `export PATH="/usr/local/bin:$PATH"` to your `.bash-profile` or `.zshrc` [link](http://apple.stackexchange.com/questions/93002/how-to-properly-update-git-on-mac)

### Ruby & Rails Installtion Using Homebrew & RVM
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
git config --global user.name <name>
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

- https://toolbelt.heroku.com/

### Install Sublime Text or Atom

- Import Preferences
- Install Fonts
- Import Custom Theme
- Install Packages ([link](https://sublime.wbond.net/installation))
- Add `export EDITOR="subl -w" # Add Sublime Text` to `.zshrc`
- Symlink `subl` to Sublime Text 2 ([link](http://stackoverflow.com/questions/16199581/opening-sublime-text-on-command-line-as-subl-on-mac-os)):
```bash
ln -s /Applications/Sublime\ Text 2.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl
```

### Postgres Installation
```bash
brew install postgresql
```

And don't forget to update preferences. You'll also need to follow the [postgres upgrade guides](http://www.postgresql.org/docs/9.5/static/pgupgrade.html) to update any data, if necessary. 

Alternatively, use the [Postgres app](http://postgresapp.com/)

- https://www.digitalocean.com/community/tutorials/how-to-setup-ruby-on-rails-with-postgres
- http://www.moncefbelyamani.com/how-to-install-postgresql-on-a-mac-with-homebrew-and-lunchy/
- https://www.codefellows.org/blog/how-to-install-postgresql

### Mysql Installation
```bash
brew install mysql
mysql --version
```

- http://blog.joefallon.net/2013/10/install-mysql-on-mac-osx-using-homebrew/
- http://dev.mysql.com/doc/refman/5.0/en/macosx-installation.html

### SQLite Installation

```bash
brew install sqlite
sqlite --version
```

http://www.sqlite.org/download.html

### R Installation 

[xQuartz](https://xquartz.macosforge.org/) is a dependency of R and cannot be downloaded via Homebrew. 

```bash
brew tap homebrew/science
brew install r
```

- https://davidsimpson.me/2013/02/26/installing-r-on-os-x/
- https://xquartz.macosforge.org/landing/
- https://www.nesono.com/node/355=
- http://apple.stackexchange.com/questions/121401/how-do-i-install-r-on-os-x
- http://www.sr.bham.ac.uk/~ajrs/R/r-getting_started.html

### Node and Other Binaries

```bash
binaries=(
  ack
  git
  hub
  node
  phantomjs
  pip
  redis
)
echo "installing binaries..."
brew install ${binaries[@]}

```

- [Hub for Github](https://hub.github.com/)

### AWS CLI

[AWS CLI Github Repo](https://github.com/aws/aws-cli)


### Keybase

```bash
brew install keybase
```

TODO: update private-key

### 
Inspired by this awesome environment setup guide: https://gist.github.com/g3d/2709563
