#--------------------
# Basic Setup
#--------------------
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#--------------------
# Aliases
#--------------------
alias ls='ls --color=auto'
alias ..='cd ..'
alias calendar='calcurse'
alias diskusage='ncdu'
alias sc='maim -s ./Pictures/Screenshots/$(date "+%I%M%S_%d%h").jpg'
#--------------------
# Functions
#--------------------
function mkcdir()
{
    mkdir "$1" &&
    cd "$1"
}

function search()
{
    if [$1 -eq '']; then
        firefox --search "$(xclip -o)"; exit
    else
        firefox --search "$*"; exit
    fi
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
