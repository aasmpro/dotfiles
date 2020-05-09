# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"
export EDITOR=vim

# ZSH_THEME="robbyrussell"
ZSH_THEME='agnoster'
DEFAULT_USER='aasmpro'

# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"
# DISABLE_AUTO_UPDATE="true"
# export UPDATE_ZSH_DAYS=13
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
# ENABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
# HIST_STAMPS="mm/dd/yyyy"
# ZSH_CUSTOM=/path/to/new-custom-folder

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

    archlinux
)

source $ZSH/oh-my-zsh.sh

# export MANPATH="/usr/local/man:$MANPATH"
# export LANG=en_US.UTF-8
# export ARCHFLAGS="-arch x86_64"
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# base aliases
alias szsh='source ~/.zshrc'
alias vzsh='vim ~/.zshrc && szsh'
alias bzsh='cp ~/.zshrc ~/dev/dotfiles/zsh/'
alias gzsh='gedit ~/.zshrc && szsh'
alias cds='cd ~/dev/t2b/spider && sa'
alias cdp='cd ~/dev/t2b/panda && sa'
alias cdd='cd ~/dev/dotfiles'
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
alias dbm='mysql -u root'
alias dbe='mysql -u root -e'
# alias dbgsp='scp spider:$(ssh spider "ls -t /home/reza/backup/t2b-database-backups/$(date +%Y)/$(date +%m)/* | head -1") /tmp/t2b_db.tar.gz'
# alias dbgpa='scp spider:$(ssh spider "ls -t /home/reza/backup/panda-database-backups/$(date +%Y)/$(date +%m)/* | head -1") /tmp/panda_db.tar.gz'
alias dbxsp='dbgsp && tar -C /tmp -xf /tmp/t2b_db.tar.gz'
alias dbxpa='dbgpa && tar -C /tmp -xf /tmp/panda_db.tar.gz'
alias dbcsp='dbe "drop database IF EXISTS spider; create database spider;"'
alias dbcpa='dbe "drop database IF EXISTS panda; create database panda;"'
alias dbcpp='dbe "drop database IF EXISTS poolipixel; create database poolipixel;"'
# alias dbsp='dbxsp && mysql -u root -p -e "drop database IF EXISTS spider; create database spider; use spider; source /tmp/latest_backup.sql;"'

dbgpa() {
    ssh panda "ssh t2badmin@db1 'mysqldump -u root -p$1 panda > panda.sql'";
    ssh panda "scp t2badmin@db1:~/panda.sql .";
    scp panda:/home/t2badmin/panda.sql .;
}

dbgsp() {
    ssh spider "mysqldump -u root -p$1 t2bclub > ~/spider.sql";
    ssh spider "zip -o spider.zip spider.sql";
    scp spider:/home/reza/spider.zip .;
    unzip -o spider.zip;
}

alias dbsp='dbcsp && dbe "use spider; source spider.sql; set session sql_mode = ""; set global sql_mode = "";"'
alias dbpa='dbcpa && dbe "use panda; source panda.sql; set session sql_mode = ""; set global sql_mode = "";"'
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

# aur
aur() {
    rm -rf $HOME/.aur_tmp;
    git clone $1 $HOME/.aur_tmp;
    (cd $HOME/.aur_tmp && makepkg -csi);
    rm -rf $HOME/.aur_tmp;
}

# programs aliases
alias photoshop='wine $HOME/.photoshop/PhotoshopPortable.exe'
alias ngrok='$HOME/.ngrok2/ngrok'
alias pycharm='$HOME/.pycharm/bin/pycharm.sh'

PATH='$HOME/.local/bin:/snap/bin:$HOME/.node_modules_global/bin:'+$PATH
