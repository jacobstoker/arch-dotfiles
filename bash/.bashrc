#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

. "$HOME/.cargo/env"
. "$HOME/.local/bin/env"
eval "$(starship init bash)"
eval "$(fzf --bash)"

export EDITOR=nvim
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ll='lsd -l'
alias lll='lsd -la'
alias audio-monitor='wpctl set-default 58'
alias audio-headphones='wpctl set-default 36'
alias dotfiles='cd ~/dotfiles/'
alias cf='cp ~/dotfiles/.clang-format .'
alias ct='cp ~/dotfiles/.clang-tidy .'

touchb() {
    if [[ -z "$1" ]]; then
        echo "Usage: touchb <script_name>"
        return 1
    fi

    script_name="$1"
    
    [[ "$script_name" != *.sh ]] && script_name="${script_name}.sh"

    if [[ -e "$script_name" ]]; then
        echo "Error: '$script_name' already exists."
        return 1
    fi

    cat <<EOF > "$script_name"
#!/bin/bash
EOF

    chmod +x "$script_name"
    echo "Created '$script_name'" 
}
