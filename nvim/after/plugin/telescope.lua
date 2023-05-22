local builtin = require('telescope.builtin')
local telescope = require('telescope')

telescope.setup {
  defaults = {
    cache_picker = {
      num_pickers = 10
    },
    file_ignore_patterns = {
      "wwwroot",
      "bin",
      "obj"
    }
  }
}

telescope.load_extension "file_browser"

vim.keymap.set('n', '<leader>sf', builtin.find_files,     { desc = '[s]earch [f]iles'})
vim.keymap.set('n', '<leader>st', ':Telescope file_browser<CR>',
                                                          { desc = '[s]search directory [t]ree'})
vim.keymap.set('n', '<leader>sg', builtin.git_files,      { desc = '[s]earch [g]it files'})
-- if need to use normal grep instead of live grep, in case this is slow
-- builtin.search_string({ search = vim.fn.input("Grep > ")})
vim.keymap.set('n', '<leader>sd', function() 
  vim.fn.setreg('w', vim.fn.expand('<cword>'))
  builtin.live_grep() 
end,                                                      { desc = '[s]earch [d]irectory with live_grep'})
vim.keymap.set('n', '<leader>ss', builtin.current_buffer_fuzzy_find,
                                                          { desc = '[s]earch current [source] buffer fuzzily'})

--vim.keymap.set('v', '<leader>sv', function()
--  local text = vim.getVisualSelection()
--  builtin.live_grep({ default_text = text })
--end,                                                      { desc = '[s]earch [v] register, selected text', silent = true, noremap = true})

vim.keymap.set('n', '<leader>sr', builtin.resume,         { desc = '[s]earch [r]esume'})
vim.keymap.set('n', '<leader>sh', builtin.pickers,        { desc = '[s]earch [h]istory of pickers'})
vim.keymap.set('n', '<leader>sl', builtin.oldfiles,       { desc = '[s]earch [l]ast opened files'})
vim.keymap.set('n', '<leader>sb', builtin.buffers,        { desc = '[s]earch [b]uffers that are open'})

vim.keymap.set('n', '<leader>sv', builtin.help_tags,      { desc = '[s]earch [v]im doc'})
