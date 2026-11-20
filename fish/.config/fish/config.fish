if status is-interactive
    direnv hook fish | source

    # Keep at end of interactive setup
    zoxide init fish --cmd cd | source
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
fish_add_path "$BUN_INSTALL/bin"
