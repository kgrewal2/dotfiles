#--------------------
# Basic Setup
#--------------------
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PS1="\[\033[33;1m\]\w\[\033[m\]\$ "
export EDITOR=vim
motivate

export HISTCONTROL=ignoreboth:erasedups
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk/jre

# TLMGR - Tex
alias tlmgr='/usr/share/texmf-dist/scripts/texlive/tlmgr.pl --usermode'

#--------------------
# Aliases
#--------------------
alias ..='cd ..'
alias bashrc='vim ~/Git/dotfiles/bashrc'
alias bat='echo capacity=$(cat /sys/class/power_supply/BAT0/capacity)'
alias cd-='cd -'
alias cdots='cd ~/GitSources/dotfiles'
alias colorp='xcalib -d :0 -b 1 /usr/share/color/icc/colord/hp_probook\ 5330m_user.icm'
alias dbps='sudo -iu postgres'
alias grep='grep --color=auto'
alias install='sudo pacman -S'
alias list-installed='comm -23 <(pacman -Qqett | sort) <(pacman -Qqg base -g base-devel | sort | uniq)'
alias lock='slock'
alias lowscreen='xrandr --output eDP-1 --gamma 0.7:0.7:0.7 --brightness 0.6'
alias ls='ls -hN --color=auto --group-directories-first'
alias offscreen='xrandr --output eDP1 --off'
alias remove='sudo pacman -Rns'
alias sc='maim -s ~/Pictures/Screenshots/$(date "+%I%M%S_%d%h").jpg'
alias shut='cat /sys/class/power_supply/BAT0/status && shutdown'
alias sus='cat /sys/class/power_supply/BAT0/status && systemctl suspend'
alias tlmgr='/usr/share/texmf-dist/scripts/texlive/tlmgr.pl --usermode'
alias update='sudo pacman -Sy'
alias upgrade='sudo pacman -Syu'
alias vimcpp='vim -p *.cc'
alias vimm='vim $(fzf)'
alias vimplugins='vim ~/Git/dotfiles/vim_plugins.vim'
alias vimrc='vim ~/Git/dotfiles/vimrc.vim'
alias yt='youtube-dl -i --format mp4'
alias ytaudio='youtube-dl -v -ic -o "~/Music/%(title)s.%(ext)s" --extract-audio --audio-format m4a --audio-quality 0'
alias jobsearch='cd ~/Git/LinkedIn-Easy-Apply-Bot/; python easyapplybot.py'

alias cdsd='cd ~/Documents/Classes/Software\ Design/'
alias cddm='cd ~/Documents/Classes/Data\ Mining/'
alias cdth='cd ~/Documents/Classes/Thesis'

alias myip='curl ifconfig.me'

alias ppspace='exec ~/Paperspace/Paperspace.sh'

alias dp2left='xrandr --output DP2 --left-of eDP1'

#--------------------
# Cool Console Functions
#--------------------
# Text as a URL
function cc-sharetext()
{
    echo $* | curl -F 'f:1=<-' ix.io;
}
# Gamma Brightness
function cc-display()
{
    xrandr --output $1 --gamma $2:$2:$2 --brightness $3
}
# Tiny URL
function cc-urlshorten()
{
    curl -s tinyurl.com/api-create.php?url=$1
}

# Link for a file
function cc-sharefile()
{
    curl -F file=@$1 https://ttm.sh
}

# Dictionary
function cc-lookup()
{
    curl 'dict.org/d:'+$1 | less
}

# Find a file with a pattern in name:
function cc-find() { find . -type f -iname '*'"$*"'*' -ls ; }

# Find a file with pattern $1 in name and Execute $2 on it:
function cc-execute() { find . -type f -iname '*'"${1:-}"'*' \
    -exec ${2:-file} {} \;  ; }
#--------------------
# Functions
#--------------------
function csv {
    perl -pe 's/((?<=,)|(?<=^)),/ ,/g;' "$@" | column -t -s, | less  -F -S -X -K
}

function mkcd()
{
    mkdir "$1" &&
        cd "$1"
    }

# Handy Extract Program
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

function btconnect()
{
    bluetoothctl power on;
    bluetoothctl devices | grep $1 | awk '{split($0,a," "); print a[2]}' | xargs bluetoothctl connect
}

function btoff()
{
    bluetoothctl power off;
}

# Creates an archive (*.tar.gz) from given directory.
function maketar() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }

# Create a ZIP archive of a file or folder.
function makezip() { zip -r "${1%%/}.zip" "$1" ; }

export PATH=$PATH:/home/itachi/.gem/ruby/2.7.0/bin
export PATH=$PATH:/home/itachi/.local/bin/

# SOURCE FZF
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/itachi/.sdkman"
[[ -s "/home/itachi/.sdkman/bin/sdkman-init.sh" ]] && source "/home/itachi/.sdkman/bin/sdkman-init.sh"

