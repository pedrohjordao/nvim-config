#!/nix/store/2r9n7fz1rxq088j6mi5s7izxdria6d5f-bash-5.1-p16/bin/bash

stylua . --check || exit 1
luacheck . || exit 1
