# 
# This file is based on the configuration written by
# Bruno Bonfils, <asyd@debian-fr.org> 
# Written since summer 2001

#
# My functions (don't forget to modify fpath before call compinit !!)
fpath=($HOME/.zsh/functions $fpath)

# Path
path=(/bin /sbin /usr/bin /usr/sbin /usr/local/bin /usr/local/sbin /opt/android-sdk-update-manager/platform-tools/ 
/opt/android-sdk-update-manager/tools/ /opt/local/bin /opt/local/sbin  ~)

# colors
#eval `dircolors $HOME/.zsh/colors`

autoload -U zutil
autoload -U compinit
autoload -U complist

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search



bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward
bindkey '^K' kill-whole-line
bindkey "\e[H" beginning-of-line        # Home (xorg)
bindkey "\e[1~" beginning-of-line       # Home (console)
bindkey "\e[4~" end-of-line             # End (console)
bindkey "\e[F" end-of-line              # End (xorg)
bindkey "\e[2~" overwrite-mode          # Ins
bindkey "\e[3~" delete-char             # Delete
bindkey '\eOH' beginning-of-line
bindkey '\eOF' end-of-line

# Activation
compinit

# Resource files
for file in $HOME/.zsh/rc/*.rc; do
	source $file
done
