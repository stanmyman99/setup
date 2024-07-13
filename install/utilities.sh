echo "------------------------------------------------------------------------"
echo " Utilities"
echo "------------------------------------------------------------------------"

if [[ -f ~/.utilities ]]; then
    echo "utilities are already configured"
else
    bash install/helper-apt.sh curl curl "curl"
    bash install/helper-apt.sh wget wget "wget"
    bash install/helper-apt.sh multitail multitail "multitail"
    bash install/helper-apt.sh tree tree "tree"
    bash install/helper-apt.sh fzf fzf "fzf"
    bash install/helper-apt.sh bash-completion bash-completion "bash-completion"
    #bash install/helper-apt.sh zoxide zoxide "zoxide"
    #bash install/helper-apt.sh trash-cli trash-cli "trash-cli"
fi

echo "Completed utilities"
echo " "

