# -------------------------------------
# Update the path to accomodate openai whisper
# -------------------------------------
export PATH="$HOME/.local/bin:$PATH"

# -------------------------------------
# Aliases
# -------------------------------------
alias pubip='curl ipinfo.io'
alias ipa="ifconfig | grep inet"
alias ref='display_reference_file'
alias aliasup="cp ~/Code/setup/.bash_aliases ~ && source ~/.bashrc"
alias dirsize='du -h .'
alias diskspace="du -Sh | sort -n -r"
alias folders='du -h --max-depth=1'
alias tree='tree -CAhF --dirsfirst'
alias treed='tree -CAFd'
alias sshkey='xclip -sel clip < /home/seth/.ssh/sethflared.pub && xclip -o -sel clip'
alias sshlockdown='sudo cp ~/Code/setup/templates/sshd_config_soft /etc/ssh/sshd_config && sudo systemctl restart ssh'
alias contacts="python3 ~/Code/setup/utils/printvcf.py ~/Documents/Contacts/contacts.vcf"
alias hotels="python3 ~/Code/setup/utils/hotels.py ~/Documents/Contacts/hotels.csv"
alias pixel='~/Android/Sdk/emulator/emulator -avd OSINT -gpu host'
alias pixelslow='~/Android/Sdk/emulator/emulator -avd OSINT'
alias gpt="ollama run llama3"
alias transcribe="whisper --model small"
alias mountpv='veracrypt ~/Nextcloud/Backup/Private.vc /media/veracrypt1'
alias mountcred='veracrypt ~/Nextcloud/Backup/Credentials.vc /media/veracrypt3'
alias avupdate='sudo systemctl stop clamav-freshclam & sudo freshclam & sudo systemctl start clamav-freshclam'
alias avscan='clamscan -r -i /'

# Syncup command - uploads the current folder to a destination folder such that the destination mirrors the current folder
function syncup() {
    if [ -z "$1" ]; then
        echo " "
        echo "Usage: syncup [destination]"
        echo " "
        echo "Uploads the content from the current folder and mirrors it into a destination folder"
        echo " "
        echo "Example: syncup stan@nas-homelab:~/nas"
        echo " "
    else
        rsync -avzP --delete ./ "$1"
    fi
}

# Syncdown command - uploads the current folder to a destination folder such that the destination mirrors the current folder
function syncdown() {
    if [ -z "$1" ]; then
        echo " "
        echo "Usage: syncdown [source]"
        echo " "
        echo "Downloads the content from a source folder and mirrors it into the current folder"
        echo " "
        echo "Example: syncdown stan@nas-homelab:~/nas"
        echo " "
    else
        rsync -avzP --delete "$1" ./
    fi
}

# Displays reference material, like cliff notes for man pages
function provision() {
    local filename="/home/seth/Code/setup/install/$1.sh"

    if [ -z "$1" ]; then
        echo " "
        echo "Usage: provision [module]"
        echo " "
        echo "You can pick from the following modules"
        echo "--------------------------------------"
        find /home/seth/Code/setup/install -maxdepth 1 -type f -exec basename {} \; | sed 's/\.[^.]*$//'
        echo " "
    else
        pushd .
        cd ~/Code/setup
        bash "install/$1.sh"
        popd
    fi
}

# Displays reference material, like cliff notes for man pages
function display_reference_file() {
    local filename="/home/seth/Code/setup/reference/$1.sh"

    if [ -z "$1" ]; then
        echo " "
        echo "Usage: ref [topic]"
        echo " "
        echo "You can pick from the following topics"
        echo "--------------------------------------"
        find /home/seth/Code/setup/reference -maxdepth 1 -type f -exec basename {} \; | sed 's/\.[^.]*$//'
        echo " "
    else
        highlight -O ansi $filename
    fi
}

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


