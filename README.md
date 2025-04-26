# My NeoVim Config
- Theme: rose-pine-moon
- Most configs are from [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)
- Telescope for fuzzy finder
- Neotree for visual hierarchy of the project structure
- Treesitter, a parser generator for varirable highlighting 
- Includes lsp, autocompletion and gitsigns
- Also includes neovim surround


# Requirements for Neovim
- luarocks (package manager for lua)
- nerd fonts for icons
- ripgrep for telescope live grep
- curiosity...

# Requirements for Tmux

### clone tpm
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### make the script executable
```
chmod +x ~/.tmux/plugins/tpm/tpm
```

### reload the session
```
tmux kill-server
tmux
```

### install the dependencies
```
Prefix + I ( Ctrl + B + I) 
```
