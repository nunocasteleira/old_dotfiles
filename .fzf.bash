# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/nunocasteleira/.fzf/bin* ]]; then
  export PATH="$PATH:/Users/nunocasteleira/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/nunocasteleira/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/Users/nunocasteleira/.fzf/shell/key-bindings.bash"

