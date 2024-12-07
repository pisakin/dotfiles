if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

if [ -z "$TMUX" ]; then
  tmux attach -t term || tmux new -s term
fi

. "$HOME/.cargo/env"
