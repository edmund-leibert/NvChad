---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
}

M.gitui = {
  plugin = true,

  n = {
    ["<leader>g"] = { "<cmd> _lazygit_toggle()<CR>", "Open GitUI" },
  },
  -- vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
}

M.telescope_project_nvim = {
  plugin = true,

  n = {
    ["d"] = { "d", "Delete currently selected project", opts = { noremap = true } },
    ["r"] = { "<cmd>Telescope live_grep<CR>", "Rename currently selected project", opts = { noremap = true } },
    ["c"] = { "<cmd>Telescope buffers<CR>", "Create a project", opts = { noremap = true } },
    ["s"] = { "<cmd>Telescope help_tags<CR>", "Search inside files within your project", opts = { noremap = true } },
    ["b"] = { "<cmd>Telescope commands<CR>", "Browse inside files within your project", opts = { noremap = true } },
    ["w"] = {
      "<cmd>Telescope search_history<CR>",
      "Change to the selected project's directory without opening it",
      opts = { noremap = true },
    },
    ["R"] = {
      "<cmd>Telescope registers<CR>",
      "Find a recently opened file within your project",
      opts = { noremap = true },
    },
    ["f"] = { "<cmd>Telescope marks<CR>", "Find a file within your project (same as <CR>)", opts = { noremap = true } },
  },
}

M.vim_visual_multi = {
  plugin = true,

  v = {
    ["<C-Down>"] = { "<C-Down>", "Add Cursor Down", opts = { noremap = true } },
    ["<C-Up>"] = { "<C-Up>", "Add Cursor Up", opts = { noremap = true } },
    ["\\\\\\"] = { "<leader>\\", "Add Cursor At Pos", opts = { noremap = true } },
  },
}

M.ufo = {
  plugin = true,

  n = {},
}

-- more keybinds!

return M
