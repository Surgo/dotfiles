local M = {}

M.get_python_env_path = function()
	return vim.env.VIRTUAL_ENV or vim.env.HOMEBREW_PREFIX or "/usr/bin"
end

M.get_python_exec_path = function()
	local python_env_path = M.get_python_env_path()
	return vim.fs.joinpath(python_env_path, "bin", "python3")
end

return M
