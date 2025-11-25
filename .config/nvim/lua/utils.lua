local M = {}

M.get_python_env_path = function()
	return vim.env.VIRTUAL_ENV or vim.env.HOMEBREW_PREFIX or "/usr/bin"
end

M.get_python_exec_path = function()
	local python_env_path = M.get_python_env_path()
	return vim.fs.joinpath(python_env_path, "bin", "python3")
end

M.get_mypy_exec_path = function()
	local python_env_path = M.get_python_env_path()
	local venv_mypy = vim.fs.joinpath(python_env_path, "bin", "mypy")

	if vim.fn.executable(venv_mypy) == 1 then
		return venv_mypy
	end

	local mypy_path = vim.fn.exepath("mypy")
	if mypy_path ~= "" then
		return mypy_path
	end

	return "mypy"
end
return M
