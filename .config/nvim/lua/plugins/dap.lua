require("nvim-dap-virtual-text").setup({})

local python_path = function()
	local venv = string.format("%s/bin/python", os.getenv("VIRTUAL_ENV"))
	local mason = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
	if vim.fn.executable(venv) == 1 then
		return venv
	elseif vim.fn.executable(mason) == 1 then
		return mason
	else
		return vim.fn.exepath("python3") or vim.fn.exepath("python")
	end
end

local dap_python = require("dap-python")

dap_python.setup(python_path())
dap_python.test_runner = "pytest"
