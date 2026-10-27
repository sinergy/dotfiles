# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install command-line tools using Homebrew.
# Install `wget` with IRI support.
brew install wget --with-iri

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi

# Install otehr useful binaries.
brew install pidcat
brew install git tig bash-completion git-standup
brew install bat
brew install fzf
brew install htop
brew install tlrc
brew install uv
brew install bottm

# Install homebrew cask apps
brew install ghostty
brew install 1password
brew install lastpass
brew install sublime-text
brew install sublime-merge
brew install slack
brew install raycast
brew install imageoptim
brew install jetbrains-toolbox
brew install charles
brew install gitify
brew install muzzle
