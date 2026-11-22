# ===== 日本語入力（FCITX5）=====
if command -v dbus-update-activation-environment >/dev/null 2>&1; then
  dbus-update-activation-environment --systemd \
    DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY 2>/dev/null
fi

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"

if (( SHLVL == 1 )) && command -v fcitx5 >/dev/null 2>&1 \
  && ! pgrep -x fcitx5 >/dev/null 2>&1; then
  fcitx5 --disable=wayland -d --verbose '*'=0 >/dev/null 2>&1 &!
fi

# ===== mise =====
export PATH="$HOME/.local/share/mise/shims:$PATH"

if [[ -x "$HOME/.local/bin/mise" ]]; then
  eval "$("$HOME/.local/bin/mise" activate zsh)"
elif command -v mise >/dev/null 2>&1; then
  eval "$(mise activate zsh)"
fi

# ===== fzf =====
for fzf_bindings in \
  /usr/share/doc/fzf/examples/key-bindings.zsh \
  /usr/share/fzf/key-bindings.zsh
do
  if [[ -r "$fzf_bindings" ]]; then
    source "$fzf_bindings"
    break
  fi
done

# ===== Starship =====
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

# ===== 基本エイリアス =====
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias mkdir='mkdir -pv'

# ===== Git エイリアス =====
alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit -m'
alias gca='git commit -v -a'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gd='git diff'
alias gl='git pull'
alias gp='git push'
alias gst='git status'
alias glog='git log --oneline --decorate --graph'

# ===== Zsh 補完 =====
autoload -Uz compinit
compinit
