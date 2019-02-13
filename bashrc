echo Loading shell environment ... >&2

# Set my Git user details.
gitme() {
    git config user.name "Susam Pal"
    git config user.email susam@susam.in
    git config user.name
    git config user.email
}

# Clone GitHub repository.
ghclone() {
    cd ~/git
    pwd
    if [ $# -eq 1 ]
    then
        git clone "https://github.com/susam/$1.git"
        cd "$1"
    else
        git clone "https://github.com/$1/$2.git"
        cd "$2"
    fi
    pwd
}

# Clone BitBucket repository.
bbclone() {
    cd ~/git
    pwd
    if [ $# -eq 1 ]
    then
        git clone "https://susam@bitbucket.org/susam/$1.git"
        cd "$1"
    else
        git clone "https://susam@bitbucket.org/$1/$2.git"
        cd "$2"
    fi
    pwd
}

# Redshift
red()
{
    case $1 in
        off)
            pkill redshift
            ;;
        [0-9]*)
            pkill redshift
            pkill redshift
            redshift -v -l 0:0 -t $1:$1 > ~/redshift.log 2>&1 &
            ;;
        bed)
            pkill redshift
            pkill redshift
            redshift -v -l 13:77 -t 3400:1900 > ~/redshift.log 2>&1 &
            ;;
        "")
            pkill redshift
            pkill redshift
            redshift -v -l 13:77 -t 5000:3400 > ~/redshift.log 2>&1 &
            ;;
        *)
            echo 'Usage: red [off | bed | <temperature>]' >&2
            ;;
    esac
}

# Search texlive for file
findtl()
{
    find /usr/local/texlive -name "*$1*"
}

# Execute node modules.
alias nx='PATH=$(npm bin):$PATH'

# Set environment.
PATH=~/bin:$PATH
[ -f ~/my/bin/env ] && . ~/my/bin/env

# Set terminal color.
_tput_color()
{
    printf '\x01'
    tput setaf "$1"
    printf '\x02'
}

# Reset terminal color.
_tput_reset()
{
    printf '\001'
    tput sgr0
    printf '\002'
}

# Create dynamic prompt string for PS1.
_active_prompt()
{
    # Git branch
    git_branch=$(git branch 2> /dev/null | sed -n "s/^\* *//p")
    if [ -n "$git_branch" ]
    then
        _tput_color 148 # yellow
        printf '[%s] ' "$git_branch"
    fi
    unset git_branch

    # Docker machine name
    if [ -n "$DOCKER_MACHINE_NAME" ]
    then
        _tput_color 80 # blue
        printf '[%s] ' "$DOCKER_MACHINE_NAME"
    fi

    # Current directory
    if [ "$PWD" != "$HOME" ]
    then
        if printf '%s' "$PWD" | grep -q "^$HOME"
        then
            neat_path="~${PWD#$HOME}"
        else
            neat_path=$PWD
        fi
        _tput_color 2 # green
        printf '%s' "$neat_path"
        unset neat_path 
    fi

    # Dollar or beer sign
    _tput_color 172 # orange
    if [ -n "$_PROMPT_MARK" ]
    then
        printf '%s' "$_PROMPT_MARK"
    elif [ $(date +"%a") = Fri ]
    then
        printf '%s' "$_beer "
    elif [ $(date +"%a") = Sat ]
    then
        printf '%s' "$_beer$_beer "
    else
        printf '$ '
    fi
    _tput_reset
}

# Aliases to modify the ending characters of the primary prompt.
_beer=$(printf "\xf0\x9f\x8d\xba")
alias dollar='_PROMPT_MARK="$ "'
alias beer='_PROMPT_MARK="$_beer "'
alias beer2='_PROMPT_MARK="$_beer$_beer "'

# Set the primary prompt string.
PS1='$(_active_prompt)'

echo Interactive environment is set. >&2

# Commands in this if-block is executed for login shells only.
if shopt -q login_shell
then
    echo Login environment is set. >&2
fi

# Attach to an existing tmux or a launch new tmux.
[ -n "$TMUX" ] || tmux at || tmux

echo Done >&2
