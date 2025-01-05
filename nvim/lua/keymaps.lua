-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

local function empty_split(split)
  vim.cmd(split)
  vim.cmd 'enew'
end

local function move_left_wrap()
  local col = vim.fn.col '.'
  local tcol = 1

  if vim.fn.mode() == 'i' then
    tcol = 0
    col = col - 1
  end

  if col <= tcol then
    vim.cmd 'normal! k$'
    if vim.fn.mode() == 'i' then
      vim.cmd 'normal! l'
    end
  else
    vim.cmd 'normal! h'
  end
end

local function move_right_wrap()
  local col = vim.fn.col '.'
  local line_length = vim.fn.col '$' - 1

  if vim.fn.mode() == 'i' then
    line_length = line_length + 1
  end

  if col >= line_length then
    vim.cmd 'normal! j0'
  else
    vim.cmd 'normal! l'
  end
end

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>dq', vim.diagnostic.setloclist, { desc = 'Open Diagnostic Quickfix List' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<M-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<M-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<M-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<M-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<M-left>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<M-right>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<M-down>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<M-up>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<M-S-up>', '<C-w>+', { desc = 'Increase pane height' })
vim.keymap.set('n', '<M-S-down>', '<C-w>-', { desc = 'Decrease pane height' })
vim.keymap.set('n', '<M-S-left>', '<C-w><', { desc = 'Decrease pane width' })
vim.keymap.set('n', '<M-S-right>', '<C-w>>', { desc = 'Increase pane width' })

vim.keymap.set({ 'i', 'n' }, '<C-e>', '<End>', { desc = 'End of the line' })
vim.keymap.set({ 'i', 'n' }, '<C-a>', '<Home>', { desc = 'Start of the line' })

vim.keymap.set('n', '<leader>ws', '', { desc = '+Split' })
vim.keymap.set('n', '<leader>wsv', function()
  empty_split 'vsp'
end, { desc = 'Open empty vspilt' })
vim.keymap.set('n', '<leader>wsh', function()
  empty_split 'sp'
end, { desc = 'Open empty hspilt' })

vim.keymap.set({ 'n', 'i', 'v' }, '<left>', move_left_wrap, { desc = 'Auto-wrapping cursor' })
vim.keymap.set({ 'n', 'i', 'v' }, '<right>', move_right_wrap, { desc = 'Auto-wrapping cursor' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_user_command('Q', function()
  local buf_content = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  if #buf_content == 0 or (#buf_content == 1 and buf_content[1] == '') then
    vim.cmd 'bd'
  else
    vim.cmd 'q'
  end
end, { desc = 'Close the buffer if empty, otherwise quit' })

vim.cmd 'cabbrev q Q'

-- vim: ts=2 sts=2 sw=2 et
