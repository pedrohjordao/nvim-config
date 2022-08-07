#!/nix/store/2r9n7fz1rxq088j6mi5s7izxdria6d5f-bash-5.1-p16/bin/bash

make_ignored() {
  if [ -n "$1" ]
  then
    while read -r lang; do
      if [ "$lang" != "$1" ]
      then
        printf "%s," "$lang"
      fi
    done < <(jq 'keys|@sh' -c lockfile.json)
  fi
}

TO_IGNORE=$(make_ignored $1)

SKIP_LOCKFILE_UPDATE_FOR_LANGS="$TO_IGNORE" nvim --headless -c "luafile ./scripts/write-lockfile.lua" -c "q"
# Pretty print
cp lockfile.json /tmp/lockfile.json
cat /tmp/lockfile.json | jq --sort-keys > lockfile.json
