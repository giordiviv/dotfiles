return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false, -- main does NOT support lazy-loading
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").install({
			"c",
			"lua",
			"vim",
			"vimdoc",
			"query",
			"markdown",
			"markdown_inline",
			"python",
			"html",
			"rust",
			"css",
			"typescript",
			"javascript",
		})

		-- Feature activation is now YOUR job — the plugin only installs
		-- parsers/queries. Turn on highlighting per-buffer via FileType.
		vim.api.nvim_create_autocmd("FileType", {
			callback = function(ev)
				-- Skip big files (your old size guard, preserved).
				local max_filesize = 100 * 1024 -- 100 KB
				local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(ev.buf))
				if ok and stats and stats.size > max_filesize then
					return
				end
				-- Only start if a parser is actually available for this filetype.
				local ok_start = pcall(vim.treesitter.start, ev.buf)
				if not ok_start then
					return
				end
			end,
		})
	end,
}
