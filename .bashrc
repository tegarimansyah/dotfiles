## For Bash in windows, using starship

# Alias
alias ls=eza # https://github.com/eza-community/eza
alias cat=bat # https://github.com/sharkdp/bat
alias find=fd # https://github.com/sharkdp/fd
alias grep=rg # https://github.com/BurntSushi/ripgrep
alias du=dust # https://github.com/bootandy/dust
alias htop=btm # https://github.com/ClementTsang/bottom
alias f=fzf # https://github.com/junegunn/fzf

# Shortcut
alias ..='cd ..'
alias ~='cd ~'
alias take='mkdir -p $1 && cd $1'
alias gaa='git add .'
alias gst='git status && echo && git diff'
alias gco='git checkout'
alias gcmsg='git commit -m'
alias gc!='git commit --amend'
alias glog='git log -p --decorate --oneline --graph --all'
git_current_branch() {
    git rev-parse --abbrev-ref HEAD 2>/dev/null
}
alias ggpull='git pull origin "$(git_current_branch)"'
alias ggpush='git push origin "$(git_current_branch)"'

# Enable history
PROMPT_COMMAND='history -a'

# fzf functionality
eval "$(fzf --bash)"

## fzf: Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

## fzf: CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"

## fzf: Print tree structure in the preview window
export FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'tree -C {}'"

# Start starship, should be in the end
eval "$(starship init bash)"
