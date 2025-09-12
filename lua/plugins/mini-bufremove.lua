return {
  {
    "nvim-mini/mini.bufremove",
    version = "*",
    keys = {
      { "<leader>bd", function() MiniBufremove.delete() end, desc = "Delete Buffers" },
    },
    opts = {},
  },
}
