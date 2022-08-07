#!/nix/store/2r9n7fz1rxq088j6mi5s7izxdria6d5f-bash-5.1-p16/bin/bash
PLUGINS="$HOME/.local/share/nvim/site/pack/plugins/start"
mkdir -p "$PLUGINS"

wget https://github.com/neovim/neovim/releases/download/${NVIM_TAG}/nvim.appimage
chmod +x nvim.appimage
sudo mv ./nvim.appimage /usr/bin/nvim
git clone --depth=1 https://github.com/nvim-lua/plenary.nvim.git "$PLUGINS/plenary.nvim"
