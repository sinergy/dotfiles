# Load ~/.dotfiles/.{extra,exports,aliases,functions}
# ~/.dotfiles/.extra can be used for settings you don’t want to commit
for file in ~/.dotfiles/.{extra,exports,aliases,functions}; do
  [ -r "$file" ] && source "$file"
done
unset file

export PATH="$HOME/.local/bin:$PATH"
