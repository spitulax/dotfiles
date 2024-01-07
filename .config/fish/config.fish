# Vi mode
function fish_user_key_bindings
  fish_vi_key_bindings
end
function fish_mode_prompt
  switch $fish_bind_mode
  case default
    echo -en "\e[2 q"
  case insert
      echo -en "\e[6 q"
  case replace_one
      echo -en "\e[4 q"
  case visual
      echo -en "\e[6 q"
  case "*"
      echo -en "\e[2 q"
  end
  set_color normal
end

# !! and !$ command
function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end
function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end
if [ "$fish_key_bindings" = "fish_vi_key_bindings" ];
  bind -Minsert ! __history_previous_command
  bind -Minsert '$' __history_previous_command_arguments
else
  bind ! __history_previous_command
  bind '$' __history_previous_command_arguments
end

# Environment variables
set -U fish_user_paths $HOME/.cargo/bin $HOME/.local/bin $fish_user_paths
set -x EDITOR nvim
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_CACHE_HOME $HOME/.cache
set -x XDG_DATA_HOME $HOME/.local/share
set -x REPOS $HOME/repos
set -x NOTES $HOME/notes
set -x THIRDPARTY $HOME/thirdparty
set -x TEMPDIR $HOME/.temp
set -x GPG_TTY $(tty)
# WSL
set -x C /mnt/c
set -x WINHOME /mnt/c/Users/Bintang

# Aliases
# eza
alias ls="eza -G -laH --no-user --color=always --group-directories-first --icons";
alias lr="eza -G --no-user --color=always --group-directories-first --icons";
alias la="eza -G -a --no-user --color=always --group-directories-first --icons";
alias ll="eza -G -lH --no-user --color=always --group-directories-first --icons";
alias lt="eza -G -T --no-user --color=always --group-directories-first --icons --long -L";
# shortcuts
alias vim="nvim";
alias ".."="cd ..";
alias "..."="cd ../..";
alias q="exit";
# colorizer
alias grep="grep --color";
alias egrep="egrep --color";
alias fgrep="fgrep --color";

if status is-interactive
  # Remove fish intro message
  set fish_greeting

  # Starship
  starship init fish | source
end
