PATH=$PATH:/usr/local/bin
PATH=$PATH:/usr/local/mysql/bin
PATH=$PATH:/usr/local/lib/pkgconfig
PATH=$PATH:/usr/lib/pkgconfig
PATH=$PATH:/usr/X11/lib/pkgconfig

# For the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Load nvm
export NVM_DIR="/Users/melch/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# RVM
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
