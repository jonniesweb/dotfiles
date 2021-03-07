autoload -Uz promptinit
promptinit
autoload -Uz agnoster.zsh-theme
agnoster.zsh-theme
autoload colors
colors
autoload -Uz zmv # move function
autoload -Uz zed # edit functions within zle
zle_highlight=(isearch:underline)

# tab completion
zstyle ':completion:*' special-dirs true

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,comm'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'


# Fuzzy matching of completions for when you mistype them
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# tell zsh what word delimeters are
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# iterm2
source ~/.iterm2_shell_integration.zsh

# dev
if [[ -f /opt/dev/dev.sh ]] && [[ $- == *i* ]]; then
  source /opt/dev/dev.sh
fi

# nix
if [ -e /Users/jonsimpson/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/jonsimpson/.nix-profile/etc/profile.d/nix.sh; fi


# show git branches by recency
git-recent() {
  git for-each-ref refs/heads --format='%(align:70)%(refname:short)%(end) %(committerdate:iso8601) (%(committerdate:relative))' --sort -committerdate | head -n30
}


lhm-clean() {
  rails runner "Lhm.cleanup(true)"
}

pidtree() (
  pstree $$
)

# prompt
prompt_context(){}

# dircolors
eval $(cat ~/.nix-profile/share/DIR_COLORS)

# Disable spring
export DISABLE_SPRING=1
