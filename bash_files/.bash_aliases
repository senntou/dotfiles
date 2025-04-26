alias lg='lazygit'
alias l='ls -l'
alias n='nvim'
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

svgcat() {
  if [ -z "$1" ]; then
    echo "Usage: svgcat <svg_filepath> [wezterm imgcat options]"
    return 1
  fi
  local svg_filepath="$1"
  if [ ! -f "$svg_filepath" ]; then
    echo "Error: File not found: $svg_filepath"
    return 1
  fi
  magick -background None "$svg_filepath" png:- | wezterm imgcat "${@:2}"
}

alias t="tmux new-session -A -s default"

# windows
# alias start='wsl-open'
# alias cdd='cd /mnt/c/users/wataru/'
