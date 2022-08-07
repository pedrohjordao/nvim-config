local M = {}

---
-- Function to retrieve console output
--
local function capture(cmd, raw)
	local handle = assert(io.popen(cmd, "r"))
	local output = assert(handle:read("*a"))
	handle:close()
	if raw then
		return output
	end
	output = string.gsub(string.gsub(string.gsub(output, "^%s+", ""), "%s+$", ""), "[\n\r]+", " ")
	return output
end

function M.setup()
	local dap = require("dap")
	local dapui = require("dapui")
	dapui.setup()
	local wk = require("which-key")

	dap.listeners.after.event_initialized["dapui_config"] = function()
		dapui.open()
	end
	dap.listeners.before.event_terminated["dapui_config"] = function()
		dapui.close()
	end
	dap.listeners.before.event_exited["dapui_config"] = function()
		dapui.close()
	end

	dap.adapters.go = {
		type = "executable",
		command = "node",
		args = { os.getenv("HOME") .. "/dev/golang/vscode-go/dist/debugAdapter.js" },
	}
	dap.configurations.go = {
		{
			type = "go",
			name = "Debug",
			request = "launch",
			showLog = false,
			program = "${file}",
			dlvToolPath = vim.fn.exepath("dlv"), -- Adjust to where delve is installed
		},
	}
	dap.adapters.python = {
		type = "executable",
		command = "path/to/virtualenvs/debugpy/bin/python",
		args = { "-m", "debugpy.adapter" },
	}
	dap.configurations.python = {
		{
			-- The first three options are required by nvim-dap
			type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
			request = "launch",
			name = "Launch file",

			-- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

			program = "${file}", -- This configuration will launch the current file if used.
			pythonPath = function()
				-- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
				-- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
				-- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
				local cwd = vim.fn.getcwd()
				if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
					return cwd .. "/venv/bin/python"
				elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
					return cwd .. "/.venv/bin/python"
				else
					return "/usr/bin/python"
				end
			end,
		},
	}
	dap.adapters.lldb = {
		type = "executable",
		command = capture("which lldb-vscode"), -- adjust as needed
		name = "lldb",
	}
	dap.configurations.cpp = {
		{
			name = "Launch",
			type = "lldb",
			request = "launch",
			program = function()
				return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			end,
			cwd = "${workspaceFolder}",
			stopOnEntry = false,
			args = {},

			-- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
			--
			--    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
			--
			-- Otherwise you might get the following error:
			--
			--    Error on launch: Failed to attach to the target process
			--
			-- But you should be aware of the implications:
			-- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html

			runInTerminal = false,

			-- If you use `runInTerminal = true` and resize the terminal window,
			-- lldb-vscode will receive a `SIGWINCH` signal which can cause problems
			-- To avoid that uncomment the following option
			-- See https://github.com/mfussenegger/nvim-dap/issues/236#issuecomment-1066306073
			postRunCommands = { "process handle -p true -s false -n false SIGWINCH" },
		},
	}

	-- If you want to use this for rust and c, add something like this:

	dap.configurations.c = dap.configurations.cpp
	dap.configurations.rust = dap.configurations.cpp

	wk.register({
		["<leader>"] = {
			D = {
				name = "+Debug",
				t = { dap.toggle_breakpoint, "Toggle Breakpoint" },
				c = { dap.continue, "Continue" },
				i = { dap.step_into, "Step Into" },
				o = { dap.step_over, "Step Over" },
				O = { dap.step_out, "Step Out" },
				r = { dap.repl.open, "Open Repl" },
			},
		},
	})
end

return M
