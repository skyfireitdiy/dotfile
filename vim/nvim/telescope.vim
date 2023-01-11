


lua <<EOF


local noremap = { noremap = true, silent = true }
local command_center = require("command_center")

command_center.add({
  {desc="Opencommand_center",cmd=":Telescope command_center<CR>",keys={{"n","``c",noremap},{"v","``c",noremap},},}
}, {
  mode = command_center.mode.SET
})

command_center.add({
  {desc="Telescope",cmd=":Telescope<CR>",keys={{"n","``t",noremap},{"v","``t",noremap},}},
  {desc="SearchSession",cmd=":SearchSession<CR>",keys={{"n","<Leader>SS",noremap},{"v","<Leader>SS",noremap},}},
  {desc=":Telescope colorscheme<cr>", cmd=":Telescope colorscheme<cr>", keys={{"n","<leader>co",noremap},}},
  {desc=":Telescope grep_string<cr>", cmd=":Telescope grep_string<cr>", keys={{"n","<leader>rg",noremap},}},
  {desc=":Telescope marks<cr>", cmd=":Telescope marks<cr>", keys={{"n","<leader>m",noremap},}},
  {desc=":Telescope keymaps<cr>", cmd=":Telescope keymaps<cr>", keys={{"n","<leader>k",noremap},}},
  {desc=":Telescope help_tags<cr>", cmd=":Telescope help_tags<cr>", keys={{"n","<leader>H",noremap},}},
  {desc=":Telescope current_buffer_tags<cr>", cmd=":Telescope current_buffer_tags<cr>", keys={{"n","<leader>t",noremap},}},
  {desc=":Telescope tags<cr>", cmd=":Telescope tags<cr>", keys={{"n","<leader>T",noremap},}},
  {desc=":Telescope find_files<CR>", cmd=":Telescope find_files<CR>", keys={{"n","<leader>ff",noremap},}},
  {desc=":Telescope git_files<CR>", cmd=":Telescope git_files<CR>", keys={{"n","<leader>f",noremap},}},
  {desc=":Telescope git_status<CR>", cmd=":Telescope git_status<CR>", keys={{"n","<leader>gs",noremap},}},
  {desc=":Telescope buffers<CR>", cmd=":Telescope buffers<CR>", keys={{"n","<leader>b",noremap},}},
  {desc=":Telescope current_buffer_fuzzy_find<CR>", cmd=":Telescope current_buffer_fuzzy_find<CR>", keys={{"n","<leader>l",noremap},}},
  {desc=":Telescope oldfiles<CR>", cmd=":Telescope oldfiles<CR>", keys={{"n","<leader>h",noremap},}},
  {desc=":Telescope command_history<CR>", cmd=":Telescope command_history<CR>", keys={{"n","<leader>:",noremap},}},
  {desc=":Telescope search_history<CR>", cmd=":Telescope search_history<CR>", keys={{"n","<leader>/",noremap},}},
  {desc=":Telescope git_bcommits<CR>", cmd=":Telescope git_bcommits<CR>", keys={{"n","<leader>gc",noremap},}},
  {desc=":Telescope git_commits<CR>", cmd=":Telescope git_commits<CR>", keys={{"n","<leader>gC",noremap},}},
  {desc=":Telescope commands<CR>", cmd=":Telescope commands<CR>", keys={{"n","<leader>x",noremap},}},


  }, {
      mode = command_center.mode.ADD_SET
  })

-- You dont need to set any of these options. These are the default ones. Only
-- the loading is important
require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    },
    bookmarks = {
      -- Available:
      --  * 'brave'
      --  * 'brave_beta'
      --  * 'buku'
      --  * 'chrome'
      --  * 'chrome_beta'
      --  * 'edge'
      --  * 'firefox'
      --  * 'qutebrowser'
      --  * 'safari'
      --  * 'vivaldi'
      --  * 'waterfox'
      selected_browser = 'edge',

      -- Either provide a shell command to open the URL
      url_open_command = 'microsoft-edge-stable',

      -- Or provide the plugin name which is already installed
      -- Available: 'vim_external', 'open_browser'
      url_open_plugin = nil,

      -- Show the full path to the bookmark instead of just the bookmark name
      full_path = true,

      -- Provide a custom profile name for Firefox browser
      firefox_profile_name = nil,

      -- Provide a custom profile name for Waterfox browser
      waterfox_profile_name = nil,

      -- Add a column which contains the tags for each bookmark for buku
      buku_include_tags = false,

      -- Provide debug messages
      debug = false,
    },
    command_center = {
      components = {
        command_center.component.DESC,
--        command_center.component.KEYS,
      },
      sort_by = {
        command_center.component.DESC,
        command_center.component.KEYS,
      },
      auto_replace_desc_with_cmd = false,
    }
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
require('telescope').load_extension('session-lens')
require('telescope').load_extension('media_files')
require('telescope').load_extension('bookmarks')
require('telescope').load_extension('command_center')


EOF



