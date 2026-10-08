local dap = require("dap")
local map = function(keys, func, desc)
	vim.keymap.set("n", keys, func, { desc = "DAP: " .. desc })
end
map("<leader>db", dap.toggle_breakpoint, "Toggle [B]reakpoint")
map("<leader>dB", function()
	dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, "Conditional [B]reakpoint")
map("<leader>dc", dap.continue, "[C]ontinue")
map("<leader>dn", dap.step_over, "Step over ([N]ext)")
map("<leader>di", dap.step_into, "Step [I]nto")
map("<leader>do", dap.step_out, "Step [O]ut")
map("<leader>dr", dap.repl.toggle, "Toggle [R]EPL")
map("<leader>dl", dap.run_last, "Run [L]ast")
map("<leader>dq", dap.terminate, "[Q]uit session")
map("<leader>du", function()
	require("dapui").toggle()
end, "Toggle [U]I")

map("<F5>", dap.continue, "[C]ontinue")
map("<F10>", dap.step_over, "Step over")
map("<F11>", dap.step_into, "Step into")
map("<F12>", dap.step_out, "Step out")

-- UI
require("nvim-dap-virtual-text").setup({})

-- Python
local dap_python = require("dap-python")
dap_python.setup(require("utils").get_debugpy_exec_path())
dap_python.test_runner = "pytest"
