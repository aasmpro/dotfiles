# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH='/home/aasmpro/.oh-my-zsh'

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME='agnoster'
DEFAULT_USER='aasmpro'

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	gitfast

	python
	django
	pip
	virtualenv

	zsh-autosuggestions

	node
	npm
	yarn
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# base aliases
alias szsh='source ~/.zshrc'
alias vzsh='vim ~/.zshrc && szsh'
alias gzsh='gedit ~/.zshrc && szsh'
# alias cdd='_cdd() { cd ~/dev/"$1" }; _cdd'
alias cds='cd ~/dev/t2b/spider && sa'
alias cdp='cd ~/dev/t2b/panda && sa'
alias fsrt='_fsrt() { iconv -t UTF-8 -f WINDOWS-1256//TRANSLIT $1 >> new_$1 }; _fsrt'


# network aliases
alias wre='nmcli device wifi rescan'
alias wls='wre && nmcli device wifi list'
alias wco='wre && nmcli device wifi connect'
alias mip='ip address | grep "inet" | grep -v "inet6" | grep "global" | sed "s/\/.*//" | sed "s/.*inet /http:\/\//"'
alias iip='ip=$(mip); nmap -sP $(mip | sed "s/http:\/\///" | sed "s/\.\([^.]*\)$/\.0\/24/") | grep "Nmap scan" | grep -v "_gateway" | sed "s/Nmap scan report for /http:\/\//" | sed "s/$USER (//" | sed "s/)//" | sed "s|$ip|$ip *|"'

# python aliases
alias py='python'
alias pyc='python -c'

# pip aliases
alias pir='pip install -r requirements.txt'
alias pin='pip install'
alias pun='pip uninstall'
alias pif='pip freeze > requirements.txt'
alias pil='pip list'
alias pup='python -m pip install -U pip'

# django aliases
alias dj='python manage.py'
alias djr='dj runserver'
alias djrr='_djrr() { _ip=$(mip | head -n1 | sed "s|http://||"); djr $_ip:$([ -z "$1" ] && echo 8000 || echo $1) }; _djrr'
alias djs='dj shell'
alias djcr='dj createsuperuser'
alias djc='djcr --username aasmpro'
alias djco='dj collectstatic'
alias djma='dj makemigrations'
alias djmi='dj migrate'
alias djsa='dj startapp'
alias djsp='django-admin startproject'
alias djld='dj loaddata'
alias djt='dj test'
alias djfm='find . -iwholename "*/migrations/00*.py" -not -path "*_env*"'
alias djbm='_djbm() { mkdir -p $1; djfm -exec cp --parents \{\} $1 \;}; _djbm'
# env aliases
alias vc='virtualenv _env'
alias vd='rm -rf _env'
alias sa='source _env/bin/activate && which python'
alias da='deactivate'

# git aliases
alias ggg='gcd && gst && ggpush && gcm && gst && gm develop && gst && ggpush && gcd'

# database aliases
alias dbm='mysql -u root -p'
alias dbe='mysql -u root -p -e'
alias dbgsp='scp spider:$(ssh spider "ls -t /home/reza/backup/t2b-database-backups/$(date +%Y)/$(date +%m)/* | head -1") /tmp/t2b_db.tar.gz'
# alias dbgpa='scp spider:$(ssh spider "ls -t /home/reza/backup/panda-database-backups/$(date +%Y)/$(date +%m)/* | head -1") /tmp/panda_db.tar.gz'
alias dbxsp='dbgsp && tar -C /tmp -xf /tmp/t2b_db.tar.gz'
alias dbxpa='dbgpa && tar -C /tmp -xf /tmp/panda_db.tar.gz'
alias dbcsp='mysql -u root -p -e "drop database IF EXISTS spider; create database spider;"'
alias dbcpa='mysql -u root -p -e "drop database IF EXISTS panda; create database panda;"'
alias dbcpp='mysql -u root -p -e "drop database IF EXISTS poolipixel; create database poolipixel;"'
alias dbsp='dbxsp && mysql -u root -p -e "drop database IF EXISTS spider; create database spider; use spider; source /tmp/latest_backup.sql;"'

dbgpa() {
    ssh panda "ssh t2badmin@db1 'mysqldump -u root -p$1 panda > panda.sql'";
    ssh panda "scp t2badmin@db1:~/panda.sql .";
    scp panda:/home/t2badmin/panda.sql .;
}
alias dbpa='dbcpa && dbe "use panda; source panda.sql; set session sql_mode = ''; set global sql_mode = '';"'
dbnpa() {
    dbgpa $1 && dbpa
}

# deploy aliases
deploy-panda() {
    echo 'deploying panda'
    ssh panda "ssh app1 './scripts/back.panda-redeploy.sh'";
    echo 'app1 completed'
    ssh panda "ssh app2 './scripts/back.panda-redeploy.sh'";
    echo 'app2 completed'
}

# programs aliases
alias photoshop='wine $HOME/.photoshop/PhotoshopPortable.exe'
alias ngrok='$HOME/.ngrok2/ngrok'
alias pycharm='pycharm-professional'
alias blastem='$HOME/.blastem/blastem'

PATH='$HOME/.local/bin:/snap/bin:$HOME/.node_modules_global/bin:'+$PATH
