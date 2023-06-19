local get_neotree_state = function()
  local bufnr = vim.api.nvim_get_current_buf and vim.api.nvim_get_current_buf() or vim.fn.bufnr()

  -- Get all the available sources in neo-tree
  for _, source in ipairs(require("neo-tree").config.sources) do
    -- Get each sources state
    local state = require("neo-tree.sources.manager").get_state(source)

    local is_open = state and state.bufnr
    local is_focused = is_open and state.bufnr == bufnr

    return {
      is_open = is_open,
      is_focused = is_focused,
    }
  end

  return {
    is_open = false,
    is_focused = false,
  }
end

return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },

  keys = {
    {
      "<leader>E",
      function()
        local state = get_neotree_state()
        if state.is_focused then
          -- switch back to current buffer
        else
          vim.cmd.Neotree("reveal")
        end
      end,
    },
    {
      "<leader>e",
      function()
        local state = get_neotree_state()
        if state.is_focused then
          -- switch back to current buffer
        else
          if not state.is_open then
            vim.cmd.Neotree("toggle")
          end
          vim.cmd.Neotree("focus")
        end
      end,
    },
    {
      "<leader>k",
      function()
        vim.cmd.Neotree("toggle")
      end,
    },
    { "<leader>k", "<cmd>:Neotree toggle<cr>" },
  },
  opts = {
    filesystem = {
      bind_to_cwd = true,
    },
  },
}
