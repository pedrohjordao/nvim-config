#!/nix/store/2r9n7fz1rxq088j6mi5s7izxdria6d5f-bash-5.1-p16/bin/bash

# THIS SCRIPT RUNS AUTOMATICALLY. DO NOT MANUALLY RUN IT

set -ex

declare -x XDG_DATA_HOME="${XDG_DATA_HOME:-"$HOME/.local/share"}"
declare -x NVIM_PACK_DIR="$XDG_DATA_HOME/nvim/site/pack"
declare -x NULL_LS_DIR="$PWD"

nvim -u NONE --headless \
	--cmd "set rtp+=${NULL_LS_DIR}" \
	+"luafile scripts/autogen.lua" +q
