return {
  'rose-pine/neovim',
  lazy = false,
  priority = 1000,
  config = function()
    -- Example config for Rose-Pine
    vim.g.rose_pine_variant = 'moon'  -- You can change this to 'dawn', 'moon', or 'pine' for different variants
    vim.g.rose_pine_italic = false  -- Optional: Disable italic fonts
    vim.g.rose_pine_bold = false    -- Optional: Disable bold fonts

    -- Set the background to transparent by default
    vim.g.rose_pine_disable_background = true

    -- Load the colorscheme
    require('rose-pine').setup({
      variant = vim.g.rose_pine_variant,
      disable_background = vim.g.rose_pine_disable_background,
      italic = vim.g.rose_pine_italic,
      bold = vim.g.rose_pine_bold,
    })
    vim.cmd('colorscheme rose-pine')  -- Apply the colorscheme

    -- Toggle background transparency
    local bg_transparent = true

    local toggle_transparency = function()
      bg_transparent = not bg_transparent
      vim.g.rose_pine_disable_background = bg_transparent
      vim.cmd [[colorscheme rose-pine]]  -- Reapply the colorscheme to reflect the change
    end

    -- Keymap to toggle background transparency
    vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true })
  end,
}

