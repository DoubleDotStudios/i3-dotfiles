-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    {
      '<leader>e',
      function()
        require('neo-tree.command').execute { toggle = true, vim.fn.getcwd() }
      end,
      desc = 'Toggle Neotree',
      silent = true,
    },
    {
      '<leader>o',
      function()
        if vim.bo.filetype == 'neo-tree' then
          vim.cmd.wincmd 'p'
        else
          vim.cmd.Neotree 'focus'
        end
      end,
      desc = 'Focus Neotree',
      silent = true,
    },
  },
  opts = {
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
      },
    },
    git_status = {
      symbols = {
        -- Change type
        added = '✚',
        modified = '',
        deleted = '✖',
        renamed = '󰁕',

        -- Status type
        untracked = '',
        ignored = '',
        unstaged = '󰄱',
        staged = '',
        conflict = '',
      },
    },
    close_if_last_window = true,
  },
}
