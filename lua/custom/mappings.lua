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
  }
  -- vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
}

M.telescope_project = {
  plugin = true,

  n = {
    ["d"] = { "d", "Delete currently selected project", opts = { noremap = true} },
    -- ["r"] = { "<cmd>Telescope live_grep<CR>", "Find in files" },
    -- ["c"] = { "<cmd>Telescope buffers<CR>", "Find buffers" },
    -- ["s"] = { "<cmd>Telescope help_tags<CR>", "Find help tags" },
    -- ["b"] = { "<cmd>Telescope commands<CR>", "Find commands" },
    -- ["w"] = { "<cmd>Telescope search_history<CR>", "Find search history" },
    -- ["R"] = { "<cmd>Telescope registers<CR>", "Find registers" },
    -- ["f"] = { "<cmd>Telescope marks<CR>", "Find marks" },
  }
}

M.vim_visual_multi = {
  plugin = true,

  v = {
    ["<C-Down>"] = { "<C-Down>", "Add Cursor Down", opts = { noremap = true } },
    ["<C-Up>"] = { "<C-Up>", "Add Cursor Up", opts = { noremap = true } },
    ["\\\\\\"] = { "<leader>\\", "Add Cursor At Pos", opts = { noremap = true } },
  }
}
-- more keybinds!

return M
