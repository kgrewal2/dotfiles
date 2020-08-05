#--------------------
# Basic Setup
#--------------------
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PS1="\[\033[33;1m\]\w\[\033[m\]\$ "
motivate

#--------------------
# Aliases
#--------------------
alias ..='cd ..'
alias lock='slock'
alias ls='ls -hN --color=auto --group-directories-first'
alias sc='maim -s ./Pictures/Screenshots/$(date "+%I%M%S_%d%h").jpg'
alias sus='systemctl suspend'
alias grep='grep --color=auto'
alias install='sudo pacman -S'
alias remove='sudo pacman -Rns'
alias update='sudo pacman -Sy'
alias upgrade='sudo pacman -Syu'
alias offscreen='xrandr --output eDP-1 --off'
alias tlmgr='/usr/share/texmf-dist/scripts/texlive/tlmgr.pl --usermode'
alias vimm='vim $(fzf)'
alias yt='youtube-dl -i'
alias cd-='cd -'
alias yta='youtube-dl -w -x --audio-format mp3 --audio-quality 0 -i -o "%(title)s.%(ext)s"'
alias colorp='xcalib -d :0 -b 1 /usr/share/color/icc/colord/hp_probook\ 5330m_user.icm'

#--------------------
# Functions
#--------------------
function mkcd()
{
    mkdir "$1" &&
    cd "$1"
}

# Find a file with a pattern in name:
function ff() { find . -type f -iname '*'"$*"'*' -ls ; }

# Find a file with pattern $1 in name and Execute $2 on it:
function fe() { find . -type f -iname '*'"${1:-}"'*' \
    -exec ${2:-file} {} \;  ; }

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
