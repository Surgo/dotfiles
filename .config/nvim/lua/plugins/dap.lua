local M = {}

local loaded = false

M.load = function()
	if loaded then
		return require("dap")
	end
	loaded = true

	local dap = require("dap")
	require("nvim-dap-virtual-text").setup({})
	require("dapui").setup()
	require("mason-nvim-dap").setup()

	-- Python
	local dap_python = require("dap-python")
	dap_python.setup(require("utils").get_debugpy_exec_path())
	dap_python.test_runner = "pytest"

	return dap
end

local map = function(keys, func, desc)
	vim.keymap.set("n", keys, function()
		func(M.load())
	end, { desc = "DAP: " .. desc })
end
map("<leader>db", function(dap)
	dap.toggle_breakpoint()
end, "Toggle [B]reakpoint")
map("<leader>dB", function(dap)
	dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, "Conditional [B]reakpoint")
map("<leader>dc", function(dap)
	dap.continue()
end, "[C]ontinue")
map("<leader>dn", function(dap)
	dap.step_over()
end, "Step over ([N]ext)")
map("<leader>di", function(dap)
	dap.step_into()
end, "Step [I]nto")
map("<leader>do", function(dap)
	dap.step_out()
end, "Step [O]ut")
map("<leader>dr", function(dap)
	dap.repl.toggle()
end, "Toggle [R]EPL")
map("<leader>dl", function(dap)
	dap.run_last()
end, "Run [L]ast")
map("<leader>dq", function(dap)
	dap.terminate()
end, "[Q]uit session")
map("<leader>du", function()
	require("dapui").toggle()
end, "Toggle [U]I")

map("<F5>", function(dap)
	dap.continue()
end, "[C]ontinue")
map("<F10>", function(dap)
	dap.step_over()
end, "Step over")
map("<F11>", function(dap)
	dap.step_into()
end, "Step into")
map("<F12>", function(dap)
	dap.step_out()
end, "Step out")

return M
