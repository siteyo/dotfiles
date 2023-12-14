# Environment
set -x EDITOR nvim
set -x PATH $HOME/.local/bin $PATH

set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_DATA_HOME $HOME/.local/share
set -x XDG_CACHE_HOME $HOME/.cache

# Commands to run in interactive sessions
if status is-interactive
    set -g theme_display_git yes
    set -g theme_display_git_dirty yes
    set -g theme_display_git_untracked yes
    set -g theme_display_git_ahead_verbose yes
    set -g theme_display_git_dirty_verbose yes
    set -g theme_display_git_stashed_verbose yes
    set -g theme_display_git_default_branch yes
    set -g theme_git_default_branches master main
    set -g theme_git_worktree_support yes
    set -g theme_display_docker_machine yes
    set -g theme_display_virtualenv yes
    set -g theme_display_node yes
    set -g theme_display_user ssh
    set -g theme_display_hostname ssh
    set -g theme_display_vi yes
    set -g theme_display_date true
    set -g theme_display_cmd_duration yes
    set -g theme_title_display_process yes
    set -g theme_title_display_path no
    set -g theme_title_display_user yes
    set -g theme_title_use_abbreviated_path no
    set -g theme_date_format "+%a %H:%M"
    set -g theme_date_timezone Asia/Tokyo
    set -g theme_avoid_ambiguous_glyphs yes
    set -g theme_powerline_fonts yes
    set -g theme_nerd_fonts yes
    set -g theme_show_exit_status yes
    set -g theme_display_jobs_verbose yes
    set -g default_user your_normal_user
    set -g theme_color_scheme nord
    set -g fish_prompt_pwd_dir_length 0
    set -g theme_project_dir_length 1
    set -g theme_newline_cursor yes
    set -g theme_newline_prompt '$ '
end

# aqua cli version manager
if command -v aqua &>/dev/null
    set -x AQUA_ROOT_DIR $XDG_DATA_HOME/aquaproj-aqua
    set -x PATH $AQUA_ROOT_DIR/bin $PATH
end

# fzf
test -f $HOME/.fzf.fish && echo true || echo false

## zoxide
if command -v zoxide &>/dev/null
    zoxide init fish | source
end
