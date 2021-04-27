# Basic Setup
export PS1="\[\033[31;1m\]\w\[\033[m\] $ "
export EDITOR=vim
export HISTCONTROL=ignoreboth:erasedups
export JAVA_HOME=/usr/lib/jvm/default
export BROWSER=/usr/bin/firefox
alias trash='mv -t ~/.trash/'
export PATH="/home/itachi/.local/share/gem/ruby/2.7.0/bin:$PATH"

# FZF
alias vimm='vim $(fzf)'
alias pdff='firefox $(fzf)'

# Opening Files
alias fire='firefox '

# Browsing
alias ..='cd ..'
alias copy='rsync -ah --info=progress2'
alias ls='ls --human-readable --size -1 -N --color=auto --group-directories-first'
alias 566='cd ~/Documents/Classes/566'
alias 502='cd ~/Documents/Classes/502'
function mkcd(){ mkdir "$1" && cd "$1"; }
alias grepr='grep -r'

# Git
alias gitdc='git diff --cached'
alias gitcm='git checkout main'
alias gitall='git add .'
alias gitc='git commit'
alias gitr='git checkout -f'
alias gitck='git checkout Karandeep'
alias gitmmk='git merge main Karandeep'
alias gitmkm='git merge Karandeep main'
alias gitpl='git pull'
alias gitps='git push'

# Vim
alias vimtex='vim -p *.tex *.bib'
alias vimrc='vim ~/Git/dotfiles/vim_setup/vimrc.vim'
alias vim_abbrev='vim ~/Git/dotfiles/vim_setup/vim_abbrev.vim'
alias vim_plugins='vim ~/Git/dotfiles/vim_setup/vim_plugins.vim'
alias vimtab='vim -p'
alias vimwikiupdate='cd ~/Git/private-wiki; git add .; git commit -m "$(date)"; git push'

# File Shortcuts
alias bashrc='vim ~/Git/dotfiles/bashrc'
alias dotfiles='cd ~/Git/dotfiles/'
alias docs='cd ~/Documents'

alias tlmgr='/usr/share/texmf-dist/scripts/texlive/tlmgr.pl --usermode'

# youtube-dl
alias yt='youtube-dl -i --format mp4'
alias yta='youtube-dl -v -ic -o "%(title)s.%(ext)s" -x --audio-format m4a --audio-quality 0'
alias ytcheck='youtube-dl -F'
alias ytselect='youtube-dl -f'

# System Shortcuts
alias bat='cat /sys/class/power_supply/BAT0/capacity'
alias brightness='sudo vim /sys/class/backlight/intel_backlight/brightness'
alias myip='curl ifconfig.me'
alias psql='sudo -iu postgres'
alias shut='shutdown'
alias sus='systemctl suspend'
alias sc='maim -s ~/Pictures/Screenshots/$(date "+%I%M%S_%d%h").jpg'
alias btoff='bluetoothctl power off'
alias music='cd ~/Music; cmus'
function btconnect()
{ bluetoothctl power on; bluetoothctl devices | grep $1 | awk '{split($0,a," "); print a[2]}' | xargs bluetoothctl connect; }


# Pacman
alias install='sudo pacman -S'
alias remove='sudo pacman -Rns'
alias upgrade='sudo pacman -Syu'
alias list-installed='comm -23 <(pacman -Qqett | sort) <(pacman -Qqg base -g base-devel | sort | uniq)'
alias psearch='pacman -Ss'
alias plocal='pacman -Qs'
alias pclean='sudo pacman -Scc'

# Archive Options
function maketar() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }
function makezip() { zip -r "${1%%/}.zip" "$1" ; }
function extract()
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1     ;;
            *.tar.gz)    tar xvzf $1     ;;
            *.bz2)       bunzip2 $1      ;;
            *.rar)       unrar x $1      ;;
            *.gz)        gunzip $1       ;;
            *.tar)       tar xvf $1      ;;
            *.tbz2)      tar xvjf $1     ;;
            *.tgz)       tar xvzf $1     ;;
            *.zip)       unzip $1        ;;
            *.Z)         uncompress $1   ;;
            *.7z)        7z x $1         ;;
            *)           echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

# Cool Functions
function cc-sharetext()
{
    echo $* | curl -F 'f:1=<-' ix.io;
}
function cc-urlshorten()
{
    curl -s tinyurl.com/api-create.php?url=$1
}
function cc-sharefile()
{
    curl -F file=@$1 https://ttm.sh
}
function cc-lookup()
{
    curl 'dict.org/d:'+$1 | less
}
function cc-find() { find . -type f -iname '*'"$*"'*' -ls ; }
function cc-execute() { find . -type f -iname '*'"${1:-}"'*' \
    -exec ${2:-file} {} \;  ; }
function csv {
    perl -pe 's/((?<=,)|(?<=^)),/ ,/g;' "$@" | column -t -s, | less  -F -S -X -K
}
