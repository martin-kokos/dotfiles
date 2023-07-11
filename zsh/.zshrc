#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# load default .profile
emulate sh
. ~/.profile
emulate zsh

setopt NO_EQUALS
setopt HIST_IGNORE_SPACE

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/x/google-cloud-sdk/path.zsh.inc' ]; then . '/home/x/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/x/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/x/google-cloud-sdk/completion.zsh.inc'; fi
