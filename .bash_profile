# Load ~/.extra, ~/.bash_prompt, ~/.exports, ~/.aliases and ~/.functions
# ~/.extra can be used for settings you don’t want to commit
for file in ~/.dotfiles/.{extra,bash_prompt,exports,aliases,functions}; do
  [ -r "$file" ] && source "$file"
done
unset file

# init z   https://github.com/rupa/z
. ~/.dotfiles/code/z.sh

# prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

export PATH=${PATH}:~/Development/android-sdk-macosx/platform-tools

[[ -s "$HOME/.rvm/scripts/rvm" ]] && \. "$HOME/.rvm/scripts/rvm"
source ~/.git-completion.bash

##
# Your previous /Users/Cloud/.bash_profile file was backed up as /Users/Cloud/.bash_profile.macports-saved_2013-04-11_at_07:15:13
##

# MacPorts Installer addition on 2013-04-11_at_07:15:13: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

