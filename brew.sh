# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install command-line tools using Homebrew.
# Install `wget` with IRI support.
brew install wget --with-iri

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen

# Install otehr useful binaries.
brew install repo
brew install tree
brew install pidcat
brew install bash-completion

# Install homebrew cask apps
brew cask install iterm2
brew cask install teamviewer
brew cask install google-chrome
brew cask install firefox
brew cask install 1password
brew cask install sublime-text
brew cask install hipchat
brew cask install slack
brew cask install alfred
brew cask install imageoptim
brew cask install atext
brew cask install sourcetree
brew cask install ngrok
brew cask install grammarly
brew cask install spotify
brew cask install spectacle
