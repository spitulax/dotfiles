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

if test -e ~/.config/fish/functions/bass.fish
  # Environment variables
  test -r ~/.config/envrc && bass source ~/.config/envrc
  # Aliases
  test -r ~/.config/aliasrc && bass source ~/.config/aliasrc
end

if status is-interactive
  # Remove fish intro message
  set fish_greeting

  # Starship
  starship init fish | source
end
