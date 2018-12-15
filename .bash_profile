# Load ~/.extra, ~/.exports, ~/.aliases and ~/.functions
# ~/.extra can be used for settings you don’t want to commit
for file in ~/.dotfiles/.{extra,exports,aliases,functions}; do
  [ -r "$file" ] && source "$file"
done
unset file

# prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && \. "$HOME/.rvm/scripts/rvm"

# git auto completion script, install bash-completion first through Homebrew
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
