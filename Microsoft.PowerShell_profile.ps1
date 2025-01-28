# Remove default aliases
Remove-Item alias:cat -ErrorAction SilentlyContinue
Remove-Item alias:ls -ErrorAction SilentlyContinue
Remove-Item alias:find -ErrorAction SilentlyContinue

# Alias
Set-Alias ls eza # https://github.com/eza-community/eza
Set-Alias cat bat # https://github.com/sharkdp/bat
Set-Alias find fd # https://github.com/sharkdp/fd
Set-Alias grep rg # https://github.com/BurntSushi/ripgrep
Set-Alias du dust # https://github.com/bootandy/dust
Set-Alias htop btm # https://github.com/ClementTsang/bottom
Set-Alias f fzf # https://github.com/junegunn/fzf

# Initialize Starship prompt
Invoke-Expression (&starship init powershell)

# Shortcut
Function .. { Set-Location .. }
Function ~ { Set-Location ~ }
Function take { param([string]$name) New-Item -ItemType Directory -Name $name -Force; Set-Location $name }
Function gaa { git add . }
Function gst { git status; Write-Host ""; git diff }
Function gco { param([string]$branch) git checkout $branch }
Function gcmsg { param([string]$message) git commit -m $message }
Function gc! { git commit --amend }
Function glog { git log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short --all }

# Function for current Git branch
Function git_current_branch {
    try {
        git rev-parse --abbrev-ref HEAD
    } catch {
        Write-Output ""
    }
}

Function ggpull { git pull origin (git_current_branch) }
Function ggpush { git push origin (git_current_branch) }

# Enable history
$MaximumHistoryCount = 4096
Function Add-History {
    $historyFile = "$HOME\.history"
    Get-History | Out-File -Append -FilePath $historyFile -Encoding utf8
}
Register-EngineEvent PowerShell.Exiting -Action { Add-History }

# fzf functionality
# Ensure fzf is installed and set additional options
$env:FZF_CTRL_T_OPTS = "--preview 'bat --color=always --style=numbers {}' --bind 'ctrl-/:change-preview-window(down|hidden|)'"
$env:FZF_CTRL_R_OPTS = "--bind 'ctrl-y:execute-silent(echo -n {2..} | clip)+abort' --color header:italic --header 'Press CTRL-Y to copy command into clipboard'"
$env:FZF_ALT_C_OPTS = "--preview 'tree -C {}'"

