# ===== Oh My Zsh 設定 =====
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# ===== 環境変数 =====
export GHCUP_INSTALL_BASE_PREFIX="$HOME"

# ===== Node.js (NVM) =====
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# ===== Node.js パッケージマネージャー (pnpm) =====
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# ===== GHCup (Haskell) =====
[ -f "$GHCUP_INSTALL_BASE_PREFIX/.ghcup/env" ] && . "$GHCUP_INSTALL_BASE_PREFIX/.ghcup/env"

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
