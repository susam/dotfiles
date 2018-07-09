# Set terminal color.
tput_color()
{
    printf '\x01'
    tput setaf "$1"
    printf '\x02'
}

# Reset terminal color.
tput_reset()
{
    printf '\001'
    tput sgr0
    printf '\002'
}

# Create dynamic prompt string for PS1.
active_prompt()
{
    # Git branch
    git_branch=$(git branch 2> /dev/null | sed -n "s/^\* *//p")
    if [ -n "$git_branch" ]
    then
        tput_color 148 # yellow
        printf '[%s] ' "$git_branch"
    fi
    unset git_branch

    # Docker machine name
    if [ -n "$DOCKER_MACHINE_NAME" ]
    then
        tput_color 80 # blue
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
        tput_color 2 # green
        printf '%s' "$neat_path"
        unset neat_path 
    fi

    # Dollar or beer sign
    tput_color 172 # orange
    if [ -n "$PROMPT_MARK" ]
    then
        printf '%s' "$PROMPT_MARK"
    elif [ $(date +"%a") = Fri ]
    then
        printf '%s' "$beer "
    elif [ $(date +"%a") = Sat ]
    then
        printf '%s' "$beer$beer "
    else
        printf '$ '
    fi
    tput_reset
}

# Aliases to modify the ending characters of the primary prompt.
beer=$(printf "\xf0\x9f\x8d\xba")
alias dollar='PROMPT_MARK="$ "'
alias beer='PROMPT_MARK="$beer "'
alias beer2='PROMPT_MARK="$beer$beer "'

# Set the primary prompt string.
PS1='$(active_prompt)'

# Set my Git user details.
mygit() {
    git config user.name "Susam Pal"
    git config user.email susam@susam.in
    git config user.name
    git config user.email
}

# Execute node modules.
alias nx='PATH=$(npm bin):$PATH'

# Set environment.
PATH=~/bin:$PATH
[ -f ~/my/bin/env ] && . ~/my/bin/env
echo Interactive environment is set. >&2

# Commands in this if-block is executed for login shells only.
if shopt -q login_shell
then
    echo Login environment is set. >&2
fi

# Attach to an existing tmux or a launch new tmux.
[ -n "$TMUX" ] || tmux at || tmux
