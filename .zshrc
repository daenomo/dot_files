# ===== Oh My Zsh 設定 =====
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# ===== 日本語入力 (FCITX5) =====
while true; do
  dbus-update-activation-environment --systemd DBUS_SESSION_BUS_ADDRESS DISPLAY XAUTHORITY 2> /dev/null && break
done

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
if [ $SHLVL = 1 ]; then
  (fcitx5 --disable=wayland -d --verbose '*'=0 &)
fi

# ===== mise =====
eval "$(${HOME}/.local/bin/mise activate zsh)"
