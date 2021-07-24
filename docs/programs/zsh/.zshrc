# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# export http_proxy=http://127.0.0.1:37241/
# export https_proxy=$http_proxy
# export ftp_proxy=$http_proxy
# export rsync_proxy=$http_proxy
# export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"
# export MANPATH="/usr/local/man:$MANPATH"
# export LANG=en_US.UTF-8
# export ARCHFLAGS="-arch x86_64"
# export SSH_KEY_PATH="~/.ssh/rsa_id"
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

export ZSH="$HOME/.oh-my-zsh"
export EDITOR=vim

ZSH_THEME='agnoster'
DEFAULT_USER='aasmpro'

plugins=(
	git
	gitfast

	python
	django
	pip
	virtualenv

	zsh-autosuggestions

    celery
    
    systemadmin
    encode64

    docker

	node
	npm
	yarn

    archlinux
)

source $ZSH/oh-my-zsh.sh

# base aliases
bzsh() {
    _pwd=$PWD;
    cp ~/.zshrc ~/dev/dotfiles/docs/programs/zsh;
    cd ~/dev/dotfiles;
    ga .;
    gcmsg "feat: new .zshrc file";
    ggpush;
    cd $_pwd;
}    
alias szsh='source ~/.zshrc'
alias vzsh='vim ~/.zshrc && szsh'
alias gzsh='gedit ~/.zshrc && szsh'
alias c='code .'

# projects
alias cdp='cd ~/dev/t2b/panda && sa'
alias cda='cd ~/dev/maaxu/maaxu && sa'
alias cdm='cd ~/dev/scf/matrix && sa'
alias cdd='cd ~/dev/dotfiles'

# network aliases
alias wre='nmcli device wifi rescan'
alias wls='wre && nmcli device wifi list'
alias wco='wre && nmcli device wifi connect'
alias mip='ip address | grep "inet" | grep -v "inet6" | grep "global" | sed "s/\/.*//" | sed "s/.*inet /http:\/\//"'
alias iip='ip=$(mip); nmap -sP $(mip | sed "s/http:\/\///" | sed "s/\.\([^.]*\)$/\.0\/24/") | grep "Nmap scan" | grep -v "_gateway" | sed "s/Nmap scan report for /http:\/\//" | sed "s/$USER (//" | sed "s/)//" | sed "s|$ip|$ip *|"'
alias adl='aria2c -j1 -s10'
alias wgu='wg-quick up wg0'
alias wgd='wg-quick down wg0'
alias fdns='/usr/local/bin/dnschange'

# python aliases
alias py='python'
alias pyc='python -c'

# python packages aliases
alias pypb='py setup.py sdist'
alias pypc='twine check dist/*'
alias pyput='twine upload --repository testpypi dist/*'
alias pypup='twine upload dist/*'

# pip aliases
alias pir='pip install -r requirements.txt'
alias pin='pip install'
alias pine='pin --editable'
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
alias djcm='_djcm() { cp -r $1/. .}; _djcm'

# env aliases
alias vc='virtualenv _env'
alias vd='rm -rf _env'
alias sa='source _env/bin/activate && which python'
alias da='deactivate'

# git aliases
alias ggg='gcd && gst && ggpush && gcm && gst && gm develop && gst && ggpush && gcd'
gmd() {
    gco $1;
    gm develop;
    ggpush;
    gcd;
}
alias gcdm='gco demo'
alias gddd='gd develop'
alias gdds='gd develop --stat'
alias gddmd='gd demo'
alias gddms='gd demo --stat'
alias gdmd='gd master'
alias gdms='gd master --stat'
alias gbdall='gb | grep -v master | grep -v develop | xargs git branch -D'

# database aliases
alias dbm='mysql -u root'
alias dbe='mysql -u root -e'
alias dbxsp='dbgsp && tar -C /tmp -xf /tmp/t2b_db.tar.gz'
alias dbxpa='dbgpa && tar -C /tmp -xf /tmp/panda_db.tar.gz'
alias dbcsp='dbe "drop database IF EXISTS spider; create database spider;"'
alias dbcpa='dbe "drop database IF EXISTS panda; create database panda;"'
alias dbcmx='dbe "drop database IF EXISTS maaxu; create database maaxu;"'
alias dbcma='dbe "drop database IF EXISTS matrix; create database matrix;"'

dbgpa() {
    ssh t2b-mobin1 "mysqldump --single-transaction --flush-logs -l --routines --quick -uroot -p$1 panda | gzip -f > panda.sql.gz";
    scp t2b-mobin1:/root/panda.sql.gz .;
    gzip -f -d panda.sql.gz;
}
alias dbpa='dbcpa && dbe "use panda; source panda.sql; set session sql_mode = ""; set global sql_mode = "";"'
dbnpa() {
    dbgpa $1 && dbpa
}

# aur
aur() {
    rm -rf $HOME/.aur_tmp;
    git clone $1 $HOME/.aur_tmp;
    (cd $HOME/.aur_tmp && makepkg -csi);
    rm -rf $HOME/.aur_tmp;
}

# backup
mbk() {
    sudo mv $1 $1.back
}

ubk() {
    sudo mv $1 $(sed 's/.\{5\}$//' <<< $1)
}

cbk() {
    sudo cp -r $1 $1.back
}

gameon() {
    sudo systemctl stop docker.service;
    sudo systemctl stop docker.socket;
    sudo systemctl stop mariadb.service;
    sudo systemctl stop memcached.service;
}

# programs aliases
alias photoshop='wine $HOME/.photoshop/PhotoshopPortable.exe'
alias ngrok='$HOME/.ngrok2/ngrok'
alias pycharm='$HOME/.pycharm/bin/pycharm.sh'

# others
alias wk='works'
works() {
    if [ -z "$1" ]
    then
        cat -n ~/.works
    else
        if [ "$1" = "-v" ]
        then
            vim ~/.works
        elif [[ "$1" =~ "^(\$\!?d|[1-9]{1}[0-9]*\!?d|[1-9]{1}[0-9]*,[1-9]{1}[0-9]*\!?d|\/.*\/d)$" ]] && [ -z "$2" ]
        then
            sed -i $1 ~/.works
        elif [ "$1" = "ddd" ] && [ -z "$2" ]
        then
            : > ~/.works
        elif [ "$1" = "dd" ] && [ -z "$2" ]
        then
            sed -i '$d' ~/.works
        elif [ "$1" = "d" ] && [ -z "$2" ]
        then
            sed -i '1d' ~/.works
        elif [ "$1" = "-s" ]
        then
            if [ -z "$2" ]
            then
                echo "missing sed arguments"
                return
            else
                sed -i $* ~/.works
            fi
        else
            echo $* >> ~/.works
        fi
    fi
}

fsrt() { 
    iconv -t UTF-8 -f WINDOWS-1256//TRANSLIT $1 >> new_$1 
}

repdf() {
    # -dPDFSETTINGS can be: printer, ebook and screen
    if [ -z "$1" ]
    then
        echo "missing input file";
        return
    fi
    if [[ "$2" =~ "^(printer|ebook|screen)$" ]]
    then
        _type=$2
        _output=new_$1
    elif [ -z "$2" ]
    then
        _type=ebook
        _output=new_$1
    else
        _output=$2
        if [[ "$3" =~ "^(printer|ebook|screen)$" ]]
        then
            _type=$3
        else
            _type=ebook
        fi
    fi

    gs -sDEVICE=pdfwrite -dPDFSETTINGS=/$_type -dNOPAUSE -dBATCH -sOutputFile=$_output $1;
}

alias vpn="echo -n mxpcpnDNo8 | sudo openconnect -b s1.bonclub.ir -u aasmpro --passwd-on-stdin"
PATH="$HOME/.local/bin:/snap/bin:$HOME/.node_modules_global/bin:$HOME/.deno/bin:$PATH"
