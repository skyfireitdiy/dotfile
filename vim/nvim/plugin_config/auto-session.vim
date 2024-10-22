lua<<EOF

require("auto-session").setup {
    --  log_level = "error",
    --  cwd_change_handling = {
        --      restore_upcoming_session = true, -- already the default, no need to specify like this, only here as an example
        --      pre_cwd_changed_hook = nil, -- already the default, no need to specify like this, only here as an example
        --      post_cwd_changed_hook = function() -- example refreshing the lualine status line _after_ the cwd changes
        --          -- require("lualine").refresh() -- refresh lualine so the new session name is displayed in the status bar
        --      end,
        --  },
 --   silent_restore = false,
  keys = {
    -- Will use Telescope if installed or a vim.ui.select picker otherwise
    -- { '<leader>s', '<cmd>SessionSearch<CR>', desc = 'Session search' },
    -- { '<leader>ws', '<cmd>SessionSave<CR>', desc = 'Save session' },
    -- { '<leader>wa', '<cmd>SessionToggleAutoSave<CR>', desc = 'Toggle autosave' },
  },

  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    -- ⚠️ This will only work if Telescope.nvim is installed
    -- The following are already the default values, no need to provide them if these are already the settings you want.
    session_lens = {
      -- If load_on_setup is false, make sure you use `:SessionSearch` to open the picker as it will initialize everything first
      load_on_setup = true,
      previewer = false,
      mappings = {
        -- Mode can be a string or a table, e.g. {"i", "n"} for both insert and normal mode
        delete_session = { "i", "<C-D>" },
        alternate_session = { "i", "<C-S>" },
        copy_session = { "i", "<C-Y>" },
      },
      -- Can also set some Telescope picker options
      -- For all options, see: https://github.com/nvim-telescope/telescope.nvim/blob/master/doc/telescope.txt#L112
      theme_conf = {
        border = true,
        -- layout_config = {
        --   width = 0.8, -- Can set width and height as percent of window
        --   height = 0.5,
        -- },
      },
    },
  }


}

EOF


command! SS :SessionSave

noremap <silent> <leader>s :SessionSearch<CR>
