
local bind = require("keymap.bind")
local map_cmd = bind.map_cmd

local plug_map = {
    ["n|<leader>bl"] = map_cmd("!blog_cp")
		:with_silent()
		:with_noremap()
		:with_desc("for blog_os build and cp bin to qemu"),
}

bind.nvim_load_mapping(plug_map)
