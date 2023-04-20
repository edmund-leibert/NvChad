local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- GitHub Copilot
  {
    "zbirenbaum/copilot.lua",
    lazy = false,
    enabled = true,
  },
  {
    "zbirenbaum/copilot-cmp",
    lazy = false,
    enabled = true,
    dependencies = {
      {
        "zbirenbaum/copilot.lua",
        lazy = false,
        enabled = true,
      },
      {
        "onsails/lspkind.nvim",
        lazy = false,
        enabled = true,
      }
    },
    config = function()
      require("copilot").setup({})
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
      require("copilot_cmp").setup({
        {
          formatters = {
            label = require("copilot_cmp.format").format_label_text,
            insert_text = require("copilot_cmp.format").remove_existing,
            preview = require("copilot_cmp.format").deindent,
          },
        }
      })
      local lspkind = require("lspkind")
      local cmp = require("cmp")
      require("cmp").setup({
        sources = {
          -- Copilot Source
          { name = "copilot", group_index = 2 },
          -- Other Sources
          { name = "nvim_lsp", group_index = 2 },
          { name = "path", group_index = 2 },
          { name = "luasnip", group_index = 2 },
        },
        formatting = {
          format = lspkind.cmp_format({
            mode = "symbol",
            max_width = 50,
            symbol_map = { Copilot = "" }
          })
        },
        sorting = {
          priority_weight = 2,
          comparators = {
            require("copilot_cmp.comparators").prioritize,

            -- Below is the default comparitor list and order for nvim-cmp
            cmp.config.compare.offset,

            -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
            cmp.config.compare.exact,
            cmp.config.compare.score,
            cmp.config.compare.recently_used,
            cmp.config.compare.locality,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
          },
        },
      })
      local has_words_before = function()
        if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
          local line, col = unpack(vim.api.nvim_win_get_cursor(0))
          return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
      end
      require("cmp").setup({
      mapping = {
        ["<Tab>"] = vim.schedule_wrap(function(fallback)
          if cmp.visible() and has_words_before() then
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
          else
          fallback()
          end
        end),
      },
    })
    end
  },
  {
    'akinsho/toggleterm.nvim',
    enabled = true,
    lazy = false,
    config = function()    
      require("toggleterm").setup{
        size = function(term)
          if term.direction == "horizontal" then
             return 20
          elseif term.direction == "vertical" then
             return vim.o.columns * 0.4
          else
            return 20
          end
        end,
        shell = 'pwsh-preview', -- This line sets the shell to PowerShell Preview 
      }
      local Terminal               = require('toggleterm.terminal').Terminal
      local lazygit                = Terminal:new({
        cmd = "gitui",
        dir = "git_dir",
        direction = "float",
        float_opts = {
          border = "double",
        },
        -- function to run on opening the terminal
        on_open = function(term)
          vim.cmd("startinsert!")
          vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
        end,
        -- function to run on closing the terminal
        on_close = function(term)
          vim.cmd("startinsert!")
        end,
      })
  
      function _lazygit_toggle()
        lazygit:toggle()
      end
  
      vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
    end
  },
}

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- }

return plugins

