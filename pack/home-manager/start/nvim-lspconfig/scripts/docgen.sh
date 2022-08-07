#!/nix/store/2r9n7fz1rxq088j6mi5s7izxdria6d5f-bash-5.1-p16/bin/sh
exec nvim -u NONE -E -R --headless +'set rtp+=$PWD' +'luafile scripts/docgen.lua' +q
