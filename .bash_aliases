# -------------------------------------
# Original aliases
# -------------------------------------
alias avupdate='sudo systemctl stop clamav-freshclam & sudo freshclam & sudo systemctl start clamav-freshclam'
alias avscan='clamscan -r -i /'
alias ipa="ifconfig | grep inet"
alias mountvc='veracrypt ~/Documents/Encrypted.vc /media/veracrypt1'
alias reference='cat ~/Code/aliases/reference.sh'
alias pixel='~/Android/Sdk/emulator/emulator -avd OSINT -gpu host'
alias pixelslow='~/Android/Sdk/emulator/emulator -avd OSINT'
alias pubip='curl ipinfo.io'
alias dirsize='du -h .'
alias gpt="ollama run llama3"

# -------------------------------------
# Updated from Chris Titus
# -------------------------------------

# To have colors for ls and all grep commands such as grep, egrep and zgrep
export CLICOLOR=1
export LS_COLORS='no=00:fi=00:di=00;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=>'
#export GREP_OPTIONS='--color=auto' #deprecated
alias grep="/usr/bin/grep $GREP_OPTIONS"
unset GREP_OPTIONS

# alias to show the date
alias da='date "+%Y-%m-%d %A %T %Z"'

# Aliases to modified commands
alias cp='cp -i'
alias mv='mv -i'
alias ren='mv -i'
alias rm='trash -v'
alias mkdir='mkdir -p'
alias ps='ps auxf'
alias ping='ping -c 10'
alias less='less -R'
alias multitail='multitail --no-repeat -c'
alias freshclam='sudo freshclam'

# Change directory aliases
alias home='cd ~'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Alias's for multiple directory listing commands
alias la='ls -Alh'                # show hidden files
alias ls='ls -aFh --color=always' # add colors and file type extensions
alias lx='ls -lXBh'               # sort by extension
alias lk='ls -lSrh'               # sort by size
alias lc='ls -lcrh'               # sort by change time
alias lu='ls -lurh'               # sort by access time
alias lr='ls -lRh'                # recursive ls
alias lt='ls -ltrh'               # sort by date
alias lm='ls -alh |more'          # pipe through 'more'
alias lw='ls -xAh'                # wide listing format
alias ll='ls -Flsh'               # long listing format
alias labc='ls -lap'              #alphabetical sort
alias lf="ls -l | egrep -v '^d'"  # files only
alias ldir="ls -l | egrep '^d'"   # directories only

# Search command line history
alias h="history | grep "

# Search running processes
alias p="ps aux | grep "
alias topcpu="/bin/ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10"

# Search running processes
alias p="ps aux | grep "
alias topcpu="/bin/ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10"

# Alias's for safe and forced reboots
alias rebootsafe='sudo shutdown -r now'
alias rebootforce='sudo shutdown -r -n now'

# Alias's to show disk space and space used in a folder
alias diskspace="du -S | sort -n -r |more"
alias folders='du -h --max-depth=1'
alias folderssort='find . -maxdepth 1 -type d -print0 | xargs -0 du -sk | sort -rn'
alias tree='tree -CAhF --dirsfirst'
alias treed='tree -CAFd'
alias mountedinfo='df -hT'

# Alias's for archives
alias mktar='tar -cvf'
alias mkbz2='tar -cvjf'
alias mkgz='tar -cvzf'
alias untar='tar -xvf'
alias unbz2='tar -xvjf'
alias ungz='tar -xvzf'

#######################################################
# SPECIAL FUNCTIONS
#######################################################
# Extracts any archive(s) (if unp isn't installed)
extract() {
        for archive in "$@"; do
                if [ -f "$archive" ]; then
                        case $archive in
                        *.tar.bz2) tar xvjf $archive ;;
                        *.tar.gz) tar xvzf $archive ;;
                        *.bz2) bunzip2 $archive ;;
                        *.rar) rar x $archive ;;
                        *.gz) gunzip $archive ;;
                        *.tar) tar xvf $archive ;;
                        *.tbz2) tar xvjf $archive ;;
                        *.tgz) tar xvzf $archive ;;
                        *.zip) unzip $archive ;;
                        *.Z) uncompress $archive ;;
                        *.7z) 7z x $archive ;;
                        *) echo "don't know how to extract '$archive'..." ;;
                        esac
                else
                        echo "'$archive' is not a valid file!"
                fi
        done
}

# Searches for text in all files in the current folder
ftext() {
        # -i case-insensitive
        # -I ignore binary files
        # -H causes filename to be printed
        # -r recursive search
        # -n causes line number to be printed
        # optional: -F treat search term as a literal, not a regular expression
        # optional: -l only print filenames and not the matching lines ex. grep -irl "$1" *
        grep -iIHrn --color=always "$1" . | less -r
}

# Copy file with a progress bar
cpp() {
        set -e
        strace -q -ewrite cp -- "${1}" "${2}" 2>&1 |
                awk '{
        count += $NF
        if (count % 10 == 0) {
                percent = count / total_size * 100
                printf "%3d%% [", percent
                for (i=0;i<=percent;i++)
                        printf "="
                        printf ">"
                        for (i=percent;i<100;i++)
                                printf " "
                                printf "]\r"
                        }
                }
        END { print "" }' total_size="$(stat -c '%s' "${1}")" count=0
}


# Goes up a specified number of directories  (i.e. up 4)
up() {
        local d=""
        limit=$1
        for ((i = 1; i <= limit; i++)); do
                d=$d/..
        done
        d=$(echo $d | sed 's/^\///')
        if [ -z "$d" ]; then
                d=..
        fi
        cd $d
}

# Automatically do an ls after each cd, z, or zoxide
cd ()
{
        if [ -n "$1" ]; then
                builtin cd "$@" && ls
        else
                builtin cd ~ && ls
        fi
}

# Returns the last 2 fields of the working directory
pwdtail() {
        pwd | awk -F/ '{nlast = NF -1;print $nlast"/"$NF}'
}

# Show the current distribution
distribution ()
{
        local dtype="unknown"  # Default to unknown

        # Use /etc/os-release for modern distro identification
        if [ -r /etc/os-release ]; then
                source /etc/os-release
                case $ID in
                        fedora|rhel|centos)
                                dtype="redhat"
                                ;;
                        sles|opensuse*)
                                dtype="suse"
                                ;;
                        ubuntu|debian)
                                dtype="debian"
                                ;;
                        gentoo)
                                dtype="gentoo"
                                ;;
                        arch)
                                dtype="arch"
                                ;;
                        slackware)
                                dtype="slackware"
                                ;;
                        *)
                                # If ID is not recognized, keep dtype as unknown
                                ;;
                esac
        fi

        echo $dtype
}

# Show the current version of the operating system
ver() {
        local dtype
        dtype=$(distribution)

        case $dtype in
                "redhat")
                        if [ -s /etc/redhat-release ]; then
                                cat /etc/redhat-release
                        else
                                cat /etc/issue
                        fi
                        uname -a
                        ;;
                "suse")
                        cat /etc/SuSE-release
                        ;;
                "debian")
                        lsb_release -a
                        ;;
                "gentoo")
                        cat /etc/gentoo-release
                        ;;
                "arch")
                        cat /etc/os-release
                        ;;
                "slackware")
                        cat /etc/slackware-version
                        ;;
                *)
                        if [ -s /etc/issue ]; then
                                cat /etc/issue
                        else
                                echo "Error: Unknown distribution"
                                exit 1
                        fi
                        ;;
        esac
}

# Trim leading and trailing spaces (for scripts)
trim() {
        local var=$*
        var="${var#"${var%%[![:space:]]*}"}" # remove leading whitespace characters
        var="${var%"${var##*[![:space:]]}"}" # remove trailing whitespace characters
        echo -n "$var"
}

#######################################################
# Set the ultimate amazing command prompt
#######################################################

#alias hug="hugo server -F --bind=10.0.0.97 --baseURL=http://10.0.0.97"
#bind '"\C-f":"zi\n"'

#export PATH=$PATH:"$HOME/.local/bin:$HOME/.cargo/bin:/var/lib/flatpak/exports/bin:/.local/>

# Install Starship - curl -sS https://starship.rs/install.sh | sh
#eval "$(starship init bash)"
#eval "$(zoxide init bash)"






