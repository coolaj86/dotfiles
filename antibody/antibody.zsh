#!/fslhome/wmyers7/.linuxbrew/bin/zsh

ANTIBODY_BINARIES="$(dirname $0)"
mkdir -p "${ANTIBODY_HOME}" || true

antibody() {
  while read bundle; do
    source "$bundle"/*.plugin.zsh &
  done < <( ${ANTIBODY_BINARIES}/antibody $@ )
}

_antibody() {
  IFS=' ' read -A reply <<< "$(echo "bundle update")"
}
compctl -K _antibody antibody
