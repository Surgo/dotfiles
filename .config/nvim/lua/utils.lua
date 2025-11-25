local M = {}

M.get_python_env_path = function()
	return vim.env.VIRTUAL_ENV or vim.env.HOMEBREW_PREFIX or "/usr/bin"
end

M.get_python_exec_path = function()
	local python_env_path = M.get_python_env_path()
	return vim.fs.joinpath(python_env_path, "bin", "python3")
end

M.has_tool_in_venv = function(tool_name)
	local python_env = M.get_python_env_path()
	local tool_path = vim.fs.joinpath(python_env, "bin", tool_name)
	return vim.fn.executable(tool_path) == 1
end

M.get_tool_path = function(tool_name)
	if M.has_tool_in_venv(tool_name) then
		local python_env = M.get_python_env_path()
		return vim.fs.joinpath(python_env, "bin", tool_name)
	end

	local mason_tool = vim.fn.stdpath("data") .. "/mason/bin/" .. tool_name
	if vim.fn.executable(mason_tool) == 1 then
		return mason_tool
	end

	return vim.fn.exepath(tool_name)
end

return M
