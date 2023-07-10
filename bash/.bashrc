# ssh agent stuff
env=~/.ssh/agent.env

agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }

agent_start () {
    (umask 077; ssh-agent >| "$env")
    . "$env" >| /dev/null ; }

agent_load_env

# agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2= agent not running
agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)

if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
    agent_start
    ssh-add ~/.ssh/snpKey
elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
    ssh-add
    ssh-add ~/.ssh/snpKey
fi

unset env
#end ssh stuff

#so as not to be disturbed by Ctrl-S Ctrl-Q in terminals:
stty -ixon

alias proj='cd ~/Documents/Projekte'
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias cd.....='cd ../../../..'
IFS=$'\r'"$IFS"
alias rg="rg --hidden -g '!.git'"
alias docker-nuke='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'
alias vim='nvim'
alias nv='nvim'
alias pwsh='powershell'
alias ebash='nvim ~/.config/bash/.bashrc'
alias envim='cd ~/.config/nvim && nvim .'
alias sb='hr && cd shibu/shibu_rs && nv .'
alias et='et --ignore-git -I -l 2'

#git aliases
alias gs='git status'
alias gc='git commit -m'
alias gac='git add -A && git commit -m'
alias gch='git checkout'
alias gps='git push'
alias gpl='git pull'
alias gpp='git push --set-upstream origin '
alias submodule='git submodule update --recursive'
alias undo-last-commit='git reset HEAD~'
alias stage-only-non-whitespace='git diff -U0 -w --no-color | git apply --cached --ignore-whitespace --unidiff-zero -'

checkout() {
	git fetch --all
	git checkout --track origin/$1
	if [[ $? != 0 ]]; then
		git checkout $1
	fi
}

sync-branch() {
    local bn=$(git rev-parse --symbolic-full-name --abbrev-ref HEAD)
    git reset --hard origin/$bn
}

removeBranchesWithPrefix() {
  git for-each-ref --format="%(refname:short)" refs/heads/$1 | xargs git branch -d
}

test-tool() {
    if [ -z "$1" ]; then
        echo "Please provide a command to test"
        return 1
    fi

    local tool="$1"

    # Run the tool with the --help option and discard the output
    # If the tool does not exist or execution fails, it will set a non-zero status code
    $tool --help &> /dev/null

    # Check the status of the last command
    if [ $? -eq 0 ]; then
        # Command succeeded, print a success message in green
        printf "\e[32m%s ✔\n\e[0m" "$tool"
    else
        # Command failed, print a failure message in red
        printf "\e[31m%s ❌\n\e[0m" "$tool"
    fi
}

test-tools() {
	test-tool rg
	test-tool bat
	test-tool fd
	test-tool et
	test-tool docker
}

diff-lines() {
    local path=
    local line=
    while read;
    do
        esc=$'\033'
        if [[ $REPLY =~ ---\ (a/)?.* ]]; then
            continue
        elif [[ $REPLY =~ \+\+\+\ (b/)?([^[:blank:]$esc]+).* ]]; then
            path=${BASH_REMATCH[2]}
        elif [[ $REPLY =~ @@\ -[0-9]+(,[0-9]+)?\ \+([0-9]+)(,[0-9]+)?\ @@.* ]]; then
            line=${BASH_REMATCH[2]}
        elif [[ $REPLY =~ ^($esc\[[0-9;]+m)*([\ +-]) ]]; then
            echo "$path:$line:$REPLY"
            if [[ ${BASH_REMATCH[2]} != - ]]; then
                ((line++))
            fi
        fi
    done
}

branch-todos() {
    local bn=$(git rev-parse --symbolic-full-name --abbrev-ref HEAD)
    local result=$(git diff origin/develop | diff-lines | awk '/:\+/' | grep TODO | grep -v '/dev/null')
    printf "$result"
}

delete-unity-cache() {
    rm -r $LOCALAPPDATA/Unity/cache
}

# I can never remember how to mount the current working dir
run-image() {
    docker run -it --rm -v /$(pwd):/cwd/ $1 $2
}

PROMPT_COMMAND='history -a'

function parse_git_dirty {
  [[ $(git status --porcelain 2> /dev/null) ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ (\1$(parse_git_dirty))/"
}

export PS1="\[\033[32m\]\w\[\033[33m\]\$(GIT_PS1_SHOWUNTRACKEDFILES=1 GIT_PS1_SHOWDIRTYSTATE=1 __git_ps1)\[\033[00m\] \012$ "
export CARGO_REGISTRIES_CRATES_IO_PROTOCOL=sparse
