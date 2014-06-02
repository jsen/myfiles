#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '

export EDITOR=vim
alias crontabedit='sudo EDITOR=nano crontab -e'
export VISUAL=vim

# Set prompt.
# `root` has a red prompt, others a yellow one.
# If we are connected remotely, `@<hostname>` shows first.
build_ps1() {
    local prompt_color='\[\e[33m\]'
    local host=''
    [[ $UID -eq 0 ]] && prompt_color='\[\e[1;31m\]'
    [[ $SSH_TTY ]] && host="@$HOSTNAME "
    echo "${prompt_color}${host}\w\[\e[0m\] \$ "
}
PS1=$(build_ps1)
PS2='\\ '
PS4='+ $LINENO: '
