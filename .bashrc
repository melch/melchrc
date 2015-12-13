# use colors with ls
alias ls='ls -G'
export LSCOLORS=gafxcxdxbxegedabagacad

cyan=$'\e[1;36m'
magenta=$'\e[1;35m'
red=$'\e[0;31m'
yellow=$'\e[0;33m'
light_magenta=$'\e[95m'
light_green=$'\e[92m'
normal=$'\e[m'

################# GIT/ #################
function find_git_branch {
  rev_parse_directory=`git rev-parse --show-toplevel 2> /dev/null`
  if [ -f "$rev_parse_directory/.git/HEAD" ]; then
    base_dir=`basename $rev_parse_directory`
    git_branch=`git rev-parse --abbrev-ref HEAD 2> /dev/null`

    file_and_branch="$base_dir:$git_branch "
  else
    file_and_branch=''
  fi
}

# add git branch to command line prompt
PROMPT_COMMAND="find_git_branch"
PS1="\[$magenta\]\$file_and_branch\[$light_green\]\t\[$light_magenta\] \[$cyan\]\w/ \[$normal\]"

function gpo {
  find_git_branch
  git push --set-upstream origin $git_branch
}

function sprint_cleaning {
  clean_branches
  echo 'git fetch'
  git fetch
  echo 'prune'
  prune
}

function clean_branches {
  remove_branches=$(git branch|grep -v master|grep -v production)
  for i in $remove_branches; do
    echo "git branch -d $i"
    git branch -d $i
  done
}

function gm {
  git diff --name-only $1
  echo "***********************"
  git smart-merge $1
}

# function pr {
#   target = ARGV[0] || 'master'
#   # git_branch = ENV['git_branch'].chop
#   git_branch = find_git_branch
#   echo repo=`git config --get remote.origin.url`.split("/").last.split(".").first
#   echo `open https://github.com/invoca/#{repo}/pull/new/invoca:#{target}...#{git_branch}`
#   # a1=(${TEST//// })
# }

alias gaa="git add .;git status"
alias gap="git add -p;git status"
alias gc="git commit"
alias gcb="git checkout -b" #create new branch and check it out
alias gct="git checkout -t" #create new branch from remote and check it out
alias gd="git diff"
alias gdm='git diff master'
alias gds="git diff --staged"
alias gl="git log"
alias glg="git log --graph --oneline --decorate"
alias go="git checkout"
alias gom="git checkout master"
alias gpu='git push -u origin'
alias gs="git status"
alias gss="git status -sb"
alias gu='git-up'
alias prune='git remote prune origin'
alias pull='git smart-pull'
alias push='git push'
alias gsu='git submodule update --init --recursive'
################# /GIT #################


################# TERMINAL COLORING/ #################
function prod {
  set_theme 'Production'
  ssh mchun@db2.production.procoretech.com
  reset_theme
}

function set_title {
  echo -n -e "\033]0;$1\007"
}

function set_theme {
  case "$1" in
  Staging )
    set_title $1
    set_color_blue ;;
  Production )
    set_title $1
    set_color_red ;;
  * )
    echo "theme not found: $1" ;;
  esac
}

function reset_theme {
  echo -e "\033]6;1;bg;*;default\a"
  set_title ''
}

function prompt_and_reset_theme {
   echo "$1"
   reset_theme
}

function set_tab_color {
  echo -e "\033]6;1;bg;red;brightness;$1\a"
  echo -e "\033]6;1;bg;green;brightness;$2\a"
  echo -e "\033]6;1;bg;blue;brightness;$3\a"
}

function set_bg_color {
  arch -i386 osascript -e "tell front window of app \"Terminal\" to set background color to {$1}" 2> /dev/null
}

function set_color_red {
 set_bg_color "11000,324,100, -20750"
 set_tab_color "222", "0", "0"
}

function set_color_blue {
 set_bg_color "313,367,11387, -20750"
 set_tab_color "64", "128", "255"
}

function set_color_green {
  set_bg_color "0,9000,0, -20750"
  set_tab_color "0", "222", "0"
}

function set_color_brown {
  set_bg_color "10000,4500,500, -20750"
}

function set_color_black {
  set_bg_color "0,0,0, -20750"
  set_tab_color "160", "160", "160"
}
################# /TERMINAL COLORING #################


################# TOOL INTEGRATIONS/ #################
# open JIRA ticket page
function jira() {
  ruby -e 'jira_key = `git rev-parse --abbrev-ref HEAD`[/(story|web|tech)-\d+/i, 0]; `open https://ringrevenue.atlassian.net/browse/#{jira_key}`'
}

# dirtycop (rubocop extension)
function dirtyhack() {
  changed_files=`git diff --name-only | grep \.rb$` # list of changed ruby files
  rubocop -D --require ./dirty_cop.rb $changed_files
}

# tab completion for lunchy gem
LUNCHY_DIR=$(dirname `gem which lunchy`)/../extras
if [ -f $LUNCHY_DIR/lunchy-completion.bash ]; then
  . $LUNCHY_DIR/lunchy-completion.bash
fi
################# /TOOL INTEGRATIONS #################


################# MISC/ #################
alias r=". ~/code/script/bash_directory_changer $*"
alias f='find . -name'
alias console='bundle exec rails c'
alias server='bundle exec rails s -b 0.0.0.0'
alias oof_db='ssh db2.office.procore'
alias test='rspec'
alias todo='ag todomelch'
alias restart_mysql='sudo /usr/local/mysql/support-files/mysql.server restart'
alias showall='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideall='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
################# /MISC #################
