function gb() {
  git branch --sort=committerdate | tail -r | awk -F ' +' '! /\(no branch\)/ {print $2}' | fzf | xargs git checkout
}

function cf() {
  git diff --name-only  $(git rev-parse --abbrev-ref HEAD)  $(git merge-base $(git rev-parse --abbrev-ref HEAD) master) | fzf | xargs code
}

function projects() {
  cd ~/Projects/$(find ~/Documents/projects -type d -maxdepth 2 -depth 1 | sed 's/\/Users\/mattheweddy\/Projects\///' | fzf -1 -q "$1")
}

# change the tab name to the current directory
if [ $ITERM_SESSION_ID ]; then
precmd() {
  echo -ne "\033]0;${PWD##*/}\007"
}
fi