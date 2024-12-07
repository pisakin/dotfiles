#fish
#noisetorch

if [ -d "$HOME/.local/bin" ]; then
  PATH="$HOME/.local/bin:$PATH"
fi

# bash aliases
alias ll='ls =alF'
alias la='ls -A'
alias l='ls -CF'

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi
