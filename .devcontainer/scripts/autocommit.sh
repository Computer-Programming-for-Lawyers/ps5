#!/bin/bash
set -e

cd "$(git rev-parse --show-toplevel)"

# Determine current branch
BRANCH="$(git rev-parse --abbrev-ref HEAD)"

# Ensure upstream is set (don’t exit if we just set it)
if ! git rev-parse --abbrev-ref "@{u}" >/dev/null 2>&1; then
  git branch --set-upstream-to="origin/$BRANCH" "$BRANCH" >/dev/null 2>&1 || true
fi

# Pull latest (don’t hardcode main)
git pull --rebase origin "$BRANCH" >/dev/null 2>&1 || true

# --- Update extensions list every cycle ---
CODE_BIN="$(command -v code 2>/dev/null || true)"
if [ -n "$CODE_BIN" ]; then
  mkdir -p git-hooks
  "$CODE_BIN" --list-extensions > extensions-list.txt 2>/dev/null || true
  git add extensions-list.txt >/dev/null 2>&1 || true
fi

# Stage any other changes students made
git add -A >/dev/null 2>&1 || true

# If nothing staged, stop cleanly (no failure)
if git diff --cached --quiet; then
  exit 0
fi

# Commit + push
git commit -m "autocommit: $(date -u +'%Y-%m-%dT%H:%M:%SZ')" >/dev/null 2>&1 || exit 0
git push origin "$BRANCH" >/dev/null 2>&1 || true

# #!/bin/bash

# # Navigate to the root directory of the repository
# cd "$(git rev-parse --show-toplevel)" > /dev/null 2>&1

# # Update local repository information and integrate changes from the remote branch
# git pull origin main > /dev/null 2>&1

# # Check if the local branch is tracking the remote branch
# if ! git rev-parse --abbrev-ref @{u} >/dev/null 2>&1; then
#     git branch --set-upstream-to=origin/main > /dev/null 2>&1
#     exit 1
# fi

# # Check for local changes
# if git diff-index --quiet HEAD --; then
#     # No changes to commit
#     exit 0
# else
#     # Add all changes to the staging area
#     git add -A > /dev/null 2>&1

#     # Commit the changes
#     if ! git commit -m "Auto-commit changes" > /dev/null 2>&1; then
#         echo "Autocommit failed."
#         exit 1
#     fi
# fi

# # Check if there are commits to push (i.e., local branch is ahead of the remote)
# if git log origin/main..HEAD --oneline | grep . > /dev/null 2>&1; then
#     # Push the changes to the remote repository
#     if ! git push origin main > /dev/null 2>&1; then
#         echo "Push failed. Your local branch (codespaces) might be out of sync with the remote (GitHub)."
#         exit 1
#     fi
# fi

# exit 0  # Changes successfully committed and pushed (if there were any to push)