return {
  "kylechui/nvim-surround",
  version = "*", -- optional, for stability
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup()
  end
}
