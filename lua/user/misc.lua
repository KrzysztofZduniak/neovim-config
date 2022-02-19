-- require("shade").setup({
-- 	overlay_opacity = 50,
-- 	opacity_step = 1,
-- 	keys = {
-- 		brightness_up = "<leader>mu",
-- 		brightness_down = "<leader>md",
-- 		toggle = "<leader>ms",
-- 	},
-- })

require("neoscroll").setup({
	easing_function = "cubic",
})

require("auto-session").setup({
	log_level = "info",
	auto_session_enable_last_session = false,
	auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
	auto_session_enabled = true,
	auto_save_enabled = true,
	auto_restore_enabled = true,
	auto_session_suppress_dirs = nil,
	-- the configs below are lua only
	bypass_session_save_file_types = nil,
})

require("session-lens").setup({})
