#!/bin/bash -eu

# Clone the private repository that setup_claude.sh reads.
# Never abort provisioning: it can be cloned later.

PRIVATE_REPO="${PRIVATE_REPO:-git@github.com:fujikky/macos-provisioning-private.git}"
REPO_ROOT="$(ghq root 2>/dev/null || echo "${HOME}/ghq")"
PRIVATE_DIR="${PRIVATE_DIR:-${REPO_ROOT}/github.com/fujikky/macos-provisioning-private}"

echo "Setup private repository..."

if ! command -v ghq > /dev/null 2>&1; then
  echo "    ghq not found. Skipped."
  exit 0
fi

if [ -d "${PRIVATE_DIR}/.git" ]; then
  echo "    already cloned: ${PRIVATE_DIR}"
  git -C "${PRIVATE_DIR}" pull --ff-only || echo "    (skipped pull)"
  echo "Setup private repository...Done!"
  exit 0
fi

if [ -d "${PRIVATE_DIR}" ]; then
  echo "    ${PRIVATE_DIR} exists but is not a git repository. Skipped clone."
  echo "Setup private repository...Done!"
  exit 0
fi

if ghq get "${PRIVATE_REPO}"; then
  echo "Setup private repository...Done!"
else
  echo ""
  echo "    Failed to get ${PRIVATE_REPO}. Continuing without it."
  echo "    Run 'ghq get ${PRIVATE_REPO}' and scripts/setup_claude.sh to sync later."
fi
