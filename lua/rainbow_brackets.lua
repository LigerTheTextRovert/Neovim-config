-- rainbow_brackets.lua
-- Place this in ~/.config/nvim/lua/rainbow_brackets.lua

local M = {}

-- ── Colors ────────────────────────────────────────────────────────────────────
local colors = {
	{ fg = "#FFD700" }, -- Yellow  (level 1)
	{ fg = "#DA70D6" }, -- Pink    (level 2)
	{ fg = "#179FFF" }, -- Cyan    (level 3)
	{ fg = "#FFD700" }, -- Yellow  (level 1)
	{ fg = "#DA70D6" }, -- Pink    (level 2)
	{ fg = "#179FFF" }, -- Cyan    (level 3)
}

-- ── Bracket pairs (Optimized for byte checking) ───────────────────────────────
local open_bytes = {
	[string.byte("(")] = true,
	[string.byte("{")] = true,
	[string.byte("[")] = true,
}
local close_bytes = {
	[string.byte(")")] = true,
	[string.byte("}")] = true,
	[string.byte("]")] = true,
}

-- ── Node types to SKIP ────────────────────────────────────────────────────────
local skip_node_types = {
	["comment"] = true,
	["line_comment"] = true,
	["block_comment"] = true,
	["doc_comment"] = true,
	["string"] = true,
	["string_fragment"] = true,
	["string_content"] = true,
	["raw_string"] = true,
	["template_string"] = true,
	["char_literal"] = true,
	["interpreted_string_literal"] = true,
	["raw_string_literal"] = true,
}

local ns = vim.api.nvim_create_namespace("rainbow_brackets")

-- ── Setup highlight groups ────────────────────────────────────────────────────
local function setup_highlights()
	for i, color in ipairs(colors) do
		vim.api.nvim_set_hl(0, "RainbowBracket" .. i, {
			fg = color.fg,
			bold = false,
		})
	end
end

-- ── Clear highlights ──────────────────────────────────────────────────────────
local function clear_highlights(bufnr)
	if vim.api.nvim_buf_is_valid(bufnr) then
		vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)
	end
end

-- ── Check if a position is inside a skip node (Pass Root node for speed) ──────
local function is_in_skip_node(root, row, col)
	if not root then
		return false
	end

	local node = root:named_descendant_for_range(row, col, row, col + 1)
	local current = node
	while current do
		if skip_node_types[current:type()] then
			return true
		end
		current = current:parent()
	end

	return false
end

-- ── Main highlight function ───────────────────────────────────────────────────
local function highlight_brackets(bufnr)
	bufnr = bufnr or vim.api.nvim_get_current_buf()

	-- Skip special/unnamed buffers
	local buftype = vim.api.nvim_get_option_value("buftype", { buf = bufnr })
	if buftype ~= "" then
		return
	end

	clear_highlights(bufnr)

	-- Get Treesitter root ONLY ONCE per highlight pass
	local root = nil
	local ok, parser = pcall(vim.treesitter.get_parser, bufnr)
	if ok and parser then
		local tree = parser:parse()[1]
		if tree then
			root = tree:root()
		end
	end

	local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
	local stack = {}
	local level = 0

	for row, line in ipairs(lines) do
		-- Iterate through bytes instead of allocating strings
		for col = 0, #line - 1 do
			local b = string.byte(line, col + 1)

			if open_bytes[b] or close_bytes[b] then
				-- Treesitter row is 0-indexed, same as our loop logic (row - 1)
				if not is_in_skip_node(root, row - 1, col) then
					if open_bytes[b] then
						level = level + 1
						local hl = "RainbowBracket" .. ((level - 1) % #colors + 1)

						vim.api.nvim_buf_set_extmark(bufnr, ns, row - 1, col, {
							end_col = col + 1,
							hl_group = hl,
						})

						table.insert(stack, {
							level = level,
							hl = hl,
						})
					elseif close_bytes[b] then
						local top = table.remove(stack)

						if top then
							vim.api.nvim_buf_set_extmark(bufnr, ns, row - 1, col, {
								end_col = col + 1,
								hl_group = top.hl,
							})
							level = top.level - 1
						end
					end
				end -- end skip check
			end
		end
	end
end

-- ── Debounce timer ────────────────────────────────────────────────────────────
local timers = {}

local function debounced_highlight(bufnr)
	if timers[bufnr] then
		timers[bufnr]:stop()
	end
	timers[bufnr] = vim.defer_fn(function()
		if vim.api.nvim_buf_is_valid(bufnr) then
			highlight_brackets(bufnr)
		end
		timers[bufnr] = nil
	end, 120)
end

-- ── Attach to buffer ──────────────────────────────────────────────────────────
local attached = {}

local function attach(bufnr)
	bufnr = bufnr or vim.api.nvim_get_current_buf()

	-- Check buftype early
	local buftype = vim.api.nvim_get_option_value("buftype", { buf = bufnr })
	if buftype ~= "" or attached[bufnr] then
		return
	end

	attached[bufnr] = true
	highlight_brackets(bufnr)

	vim.api.nvim_buf_attach(bufnr, false, {
		on_lines = function(_, buf)
			debounced_highlight(buf)
		end,
		on_detach = function(_, buf)
			clear_highlights(buf)
			attached[buf] = nil
			if timers[buf] then
				timers[buf]:stop()
				timers[buf] = nil
			end
		end,
	})
end

-- ── Public setup ──────────────────────────────────────────────────────────────
function M.setup(opts)
	opts = opts or {}

	if opts.colors then
		for i, c in ipairs(opts.colors) do
			colors[i] = c
		end
	end

	setup_highlights()

	-- Automatically attach on buffer open/read
	vim.api.nvim_create_autocmd({ "BufEnter", "BufReadPost", "BufNewFile" }, {
		pattern = "*",
		callback = function(args)
			attach(args.buf)
		end,
	})
end

return M
