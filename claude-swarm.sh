#!/usr/bin/env bash
# Spawn a 4-pane tiled tmux layout with Claude Code in each pane.

SESSION="${1:-claude-swarm}"
WINDOW="swarm"

# If called from inside tmux, create a new window in the current session.
# Otherwise, create (or attach to) a dedicated session.
if [ -n "$TMUX" ]; then
  tmux new-window -n "$WINDOW"
else
  tmux new-session -d -s "$SESSION" -n "$WINDOW" 2>/dev/null || true
fi

tmux split-window -t "$WINDOW"
tmux split-window -t "$WINDOW"
tmux split-window -t "$WINDOW"
tmux select-layout -t "$WINDOW" tiled

# Launch claude in every pane
for pane in $(tmux list-panes -t "$WINDOW" -F '#{pane_id}'); do
  tmux send-keys -t "$pane" "claude" Enter
done

# Attach if we started a new session outside tmux
if [ -z "$TMUX" ]; then
  tmux attach-session -t "$SESSION"
fi
