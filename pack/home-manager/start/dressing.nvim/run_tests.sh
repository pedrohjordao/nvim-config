#!/nix/store/2r9n7fz1rxq088j6mi5s7izxdria6d5f-bash-5.1-p16/bin/bash
set -e

nvim --headless --noplugin -u tests/init.lua \
  -c "PlenaryBustedDirectory ${1-tests} { minimal_init = './tests/init.lua' }"
