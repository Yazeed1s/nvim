-- +-------------------------------------------------+
-- | A | B | C                             X | Y | Z |
-- +-------------------------------------------------+
-- insert -> insert mode, normal -> normal mode, visual -> visual mode
local custom_16 = require("lualine.themes.base16")
-- Change the background of lualine_c section for normal mode
custom_16.normal.c.bg = "#1A191E"
custom_16.normal.b.bg = "#1A191E"
--custom_16.normal.a.bg = '#8BB8D0'
custom_16.normal.c.fg = "#695F69"
custom_16.normal.b.fg = "#695F69"
custom_16.insert.b.fg = "#695F69"
custom_16.insert.b.bg = "#1A191E"
custom_16.visual.b.bg = "#1A191E"
custom_16.insert.b.fg = "#695F69"
custom_16.visual.b.fg = "#695F69"
custom_16.insert.a.bg = "#A896BE"

require("lualine").setup({

	options = {
		icons_enabled = true,
		-- theme = custom_16,
		-- thene = "everforest",
		theme = "gruvbox",
		-- theme = "base16",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = {
			{
				"filename",
				file_status = true, -- Displays file status (readonly status, modified status)
				newfile_status = true, -- Display new file status (new file means no write after created)
				path = 3, -- 0: Just the filename
				-- 1: Relative path
				-- 2: Absolute path
				-- 3: Absolute path, with tilde as the home directory

				shorting_target = 80, -- Shortens path to leave 40 spaces in the window
				-- for other components. (terrible name, any suggestions?)
				symbols = {
					modified = "[+]", -- Text to show when the file is modified.
					readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
					unnamed = "[No Name]", -- Text to show for unnamed buffers.
					newfile = "[New]", -- Text to show for new created file before first writting
				},
			},
		},

		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})
