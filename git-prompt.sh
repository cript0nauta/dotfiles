_gp_color(){
    case "$1" in
        red)
            echo -n $'\x1b[31m'  # local diverges from remote
            ;;
        green)
            echo -n $'\x1b[32m'  # local == remote
            ;;
        yellow)
            echo -n $'\x1b[33m'  # local is behind
            ;;
        purple)
            echo -n $'\x1b[35m'  # local is ahead
            ;;
        white)
            echo -n $'\x1b[37m'  # no remote branch
            ;;
        *)
            echo "Invalid color: ${1}"
            return 1
            ;;
    esac
    eval "echo -n \$$1"
    shift
    echo "$@"
    echo -n $'\x1b[0m'
}

_gp_is_git_repo(){
    # Git info
    local current_commit_hash
    current_commit_hash=$(git rev-parse HEAD 2> /dev/null)
    [[ -n "$current_commit_hash" ]] && [[ "$(git config --get git-prompt.enabled)" != false ]]
}

_gp_prompt_text(){
    local head
    head="$(git rev-parse --abbrev-ref HEAD 2>/dev/null)"
    echo -n "$head"
    echo -n ' '
    if ! git diff --quiet 2>/dev/null; then
        echo -n '*'  # dirty
    fi

    if ! git diff --quiet --staged 2>/dev/null; then
        echo -n '+'  # staged
    fi

    if [[ -n "$(git ls-files -o --exclude-standard)" ]]; then
        echo -n '_'  # untracked
    fi

    echo ''
}

_gp_prompt_color(){
    if git diff --quiet '@{u}' '@{0}' 2>/dev/null; then
        echo green
        return
    else
        if [ $? = 128 ]; then
            echo white
            return
        fi
    fi
    local common_commit
    common_commit="$(git merge-base '@{0}' '@{u}')"
    if git diff --quiet '@{u}' "${common_commit}"; then
        echo purple
    else
        if git diff --quiet '@{0}' "${common_commit}"; then
            echo yellow
        else
            echo red
        fi
    fi
}

git_prompt(){
    _gp_is_git_repo && echo '' && _gp_color "$(_gp_prompt_color)" "$(_gp_prompt_text)"
}

PROMPT_COMMAND=git_prompt
