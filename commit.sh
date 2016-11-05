#!/bin/bash
#
# Wrapper for git commit
# Plathform: Git
#
# Author: Dmitry Ivanov
#

if [ ! "$1" ]; then
  echo "You should enter commit message:"
  echo "Usage: $0 <Commit message>"
  echo
  exit 1
fi

echo "=== Commiting changes to GitHub ==="
echo
read -n 1 -p "Are you sure that you want to commit all changes to original master? (y/[Any key to cancel]): " WANT_COMMIT
echo
[ "$WANT_COMMIT" = "y" ] || exit 2

git add --all . && git commit -a -m "$(echo "$@")" && git push -u origin master

echo 
exit 0

