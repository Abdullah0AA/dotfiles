function lt --wraps eza --description 'List files as a tree. gitignore aware'
    eza --tree --git-ignore --icons=auto --group-directories-first $argv
end
