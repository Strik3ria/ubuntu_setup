# Set Alien theme
export ALIEN_THEME="gruvbox"

# Set left side prompt elements
export ALIEN_SECTIONS_LEFT=(
        exit
        user
        path
        vcs_branch:async
        vcs_status:async
        vcs_dirty:async
        newline
        ssh
        venv
        prompt
)

# Set Right side prompt elements
export ALIEN_SECTIONS_RIGHT=(
        time
)

# Install plugins (normally controlled by Antigen/OMZsh)
plugins=(zsh-autosuggestions zsh-completions zsh-syntax-highlighting alien)

for plugin in $plugins; do
        source "/home/${USER}/.zsh/plugins/$plugin/$plugin.plugin.zsh";
done

# Singular PATH extender
PATH=$PATH:~/.local/bin

# General Aliases
alias evim=vim\ ~/.config/nvim/init.vim
alias ezsh=vim\ ~/.zshrc
alias cdr=cd\ ~/source/git
alias cdw=cd\ /mnt/c/Users/rober
alias cdnv=cd\ ~/.config/nvim
alias flask_env=source\ ~/venvs/flask_class/bin/activate
alias google_env=source\ ~/venvs/google_cal/bin/activate
alias c=clear
alias vim=nvim
alias vi=nvim
alias history='history 1'

# Needed to ensure that zsh produces history
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory

# Needed for aws-vault to know what keyring backend to use
export AWS_VAULT_BACKEND=pass
