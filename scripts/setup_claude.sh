#!/bin/bash -eu

# ~/.claude holds large generated files (cache, projects, history), so link
# per file and per skill instead of linking the whole directory.

BASEDIR=$(cd $(dirname $0)/.. && pwd)
SRC="${BASEDIR}/dotfiles/.claude"
DEST="${HOME}/.claude"
REPO_ROOT="$(ghq root 2>/dev/null || echo "${HOME}/ghq")"
PRIVATE_DIR="${PRIVATE_DIR:-${REPO_ROOT}/github.com/fujikky/macos-provisioning-private}"
CLAUDE_PRIVATE_DIR="${CLAUDE_PRIVATE_DIR:-${PRIVATE_DIR}/claude}"

echo "Setup Claude Code..."

mkdir -p "${DEST}/hooks" "${DEST}/skills"

link() {
  local from=$1
  local dest=$2
  echo "    $dest -> $from"
  rm -rf "$dest"
  ln -s "$from" "$dest"
}

link "${SRC}/CLAUDE.md" "${DEST}/CLAUDE.md"

for hook in "${SRC}"/hooks/*; do
  link "$hook" "${DEST}/hooks/$(basename "$hook")"
done

for skill in "${SRC}"/skills/*; do
  [ -d "$skill" ] || continue
  link "$skill" "${DEST}/skills/$(basename "$skill")"
done

if [ -d "${CLAUDE_PRIVATE_DIR}/skills" ]; then
  echo ""
  echo "files from private repository:"
  for skill in "${CLAUDE_PRIVATE_DIR}"/skills/*; do
    [ -d "$skill" ] || continue
    link "$skill" "${DEST}/skills/$(basename "$skill")"
  done
else
  echo ""
  echo "    (skipped private skills: ${CLAUDE_PRIVATE_DIR}/skills not found)"
fi

# Claude Code rewrites settings.json itself, so generate it by merging instead
# of linking. Later inputs win, so the managed values override the local ones.
echo ""
echo "generate settings.json:"

TMPDIR_CLAUDE=$(mktemp -d)
trap 'rm -rf "$TMPDIR_CLAUDE"' EXIT

sed "s|\$HOME|${HOME}|g" "${SRC}/settings.base.json" > "${TMPDIR_CLAUDE}/base.json"

MERGE_INPUTS=()
if [ -f "${DEST}/settings.json" ]; then
  MERGE_INPUTS+=("${DEST}/settings.json")
fi
MERGE_INPUTS+=("${TMPDIR_CLAUDE}/base.json")
if [ -f "${CLAUDE_PRIVATE_DIR}/settings.private.json" ]; then
  echo "    merge ${CLAUDE_PRIVATE_DIR}/settings.private.json"
  MERGE_INPUTS+=("${CLAUDE_PRIVATE_DIR}/settings.private.json")
else
  echo "    (skipped ${CLAUDE_PRIVATE_DIR}/settings.private.json: not found)"
fi

jq -s 'reduce .[] as $item ({}; . * $item)' "${MERGE_INPUTS[@]}" > "${TMPDIR_CLAUDE}/settings.json"

if [ -f "${DEST}/settings.json" ] && diff -q "${DEST}/settings.json" "${TMPDIR_CLAUDE}/settings.json" > /dev/null; then
  echo "    ${DEST}/settings.json (no change)"
else
  [ -f "${DEST}/settings.json" ] && cp "${DEST}/settings.json" "${DEST}/settings.json.bak"
  cp "${TMPDIR_CLAUDE}/settings.json" "${DEST}/settings.json"
  echo "    ${DEST}/settings.json (updated)"
fi

echo ""
echo "Setup Claude Code...Done!"
