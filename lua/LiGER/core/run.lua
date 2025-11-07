-- Utility: run current file based on extension
function RunCurrentFile()
  local file = vim.fn.expand("%:p")
  local ext = vim.fn.expand("%:e")
  local cmd = nil

  if ext == "js" then
    cmd = "node " .. file
  elseif ext == "ts" then
    cmd = "ts-node " .. file
  elseif ext == "py" then
    cmd = "python3 " .. file
  elseif ext == "cpp" then
    local output = vim.fn.expand("%:r")
    cmd = string.format("g++ %s -o %s && ./%s", file, output, vim.fn.fnamemodify(output, ":t"))
  elseif ext == "c" then
    local output = vim.fn.expand("%:r")
    cmd = string.format("gcc %s -o %s && %s", file, output, output)
  else
    print("Unsupported file type: " .. ext)
    return
  end

  -- Open a split terminal and run
  vim.cmd("vsplit | terminal " .. cmd)
  vim.cmd("startinsert")
end

-- Keybinding
vim.keymap.set("n", "<leader>0", RunCurrentFile, { noremap = true, silent = true })
