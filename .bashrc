stty -ixon  # stop stupid ctrl+s crap

alias tmux="TERM=xterm-256color agenttmux"
alias t="tmux a || tmux"

# easy note-taking
n() {
	if [ $# -eq 0 ]; then
		(ym && exec $EDITOR $HOME/notes/$(git rev-parse --abbrev-ref HEAD)) ;
	else
		$EDITOR $HOME/notes/"$*" ;
	fi
}
nls() {
	ls -c $HOME/notes/ | grep "$*"
}

# go to pg dir for repo
pg() {
    if [ $# -eq 0 ]; then
        cd `git rev-parse --show-toplevel`
    else
        cd $HOME/pg/"$*" ;
    fi
}

_pg() {
    local cur prev opts
    cur="${COMP_WORDS[COMP_CWORD]}"
    opts=$(ls --indicator-style=none --color=never $HOME/pg/)
    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
}

complete -F _pg pg
