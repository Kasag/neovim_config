vim.api.nvim_create_user_command("ClipboardDebug", function()
  local lines = {}

  local function add(label, value)
    lines[#lines + 1] = label .. ": " .. vim.inspect(value)
  end

  local function try(label, fn)
    local ok, result = pcall(fn)
    add(label, ok and result or ("ERROR: " .. tostring(result)))
  end

  lines[#lines + 1] = "# Clipboard Debug"
  lines[#lines + 1] = ""

  add("clipboard option", vim.o.clipboard)
  add("vim.g.clipboard", vim.g.clipboard)
  try("provider executable", function()
    return vim.fn["provider#clipboard#Executable"]()
  end)

  lines[#lines + 1] = ""
  lines[#lines + 1] = "## OS"
  for _, feature in ipairs({ "macunix", "unix", "win32", "win64", "wsl" }) do
    add("has(" .. feature .. ")", vim.fn.has(feature))
  end

  lines[#lines + 1] = ""
  lines[#lines + 1] = "## Clipboard Tools"
  for _, cmd in ipairs({
    "pbcopy",
    "pbpaste",
    "wl-copy",
    "wl-paste",
    "xclip",
    "xsel",
    "win32yank.exe",
    "clip.exe",
    "powershell.exe",
  }) do
    add("executable(" .. cmd .. ")", vim.fn.executable(cmd))
  end

  lines[#lines + 1] = ""
  lines[#lines + 1] = "## Environment"
  for _, name in ipairs({
    "PATH",
    "DISPLAY",
    "WAYLAND_DISPLAY",
    "SSH_TTY",
    "SSH_CONNECTION",
    "TMUX",
    "WSL_DISTRO_NAME",
    "WT_SESSION",
    "TERM_PROGRAM",
  }) do
    add(name, vim.env[name])
  end

  lines[#lines + 1] = ""
  lines[#lines + 1] = "## Registers"
  try("getreg(+)", function()
    return "ok, length=" .. #vim.fn.getreg("+")
  end)
  try("getreg(*)", function()
    return "ok, length=" .. #vim.fn.getreg("*")
  end)

  vim.cmd("new")
  local buf = vim.api.nvim_get_current_buf()
  vim.bo[buf].buftype = "nofile"
  vim.bo[buf].bufhidden = "wipe"
  vim.bo[buf].swapfile = false
  vim.bo[buf].filetype = "markdown"
  vim.api.nvim_buf_set_name(buf, "ClipboardDebug")
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  vim.bo[buf].modifiable = false
end, {})
