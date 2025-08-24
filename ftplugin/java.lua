local jdtls = require 'jdtls'
local config = {
  cmd = { vim.fn.expand '~/.local/share/nvim/mason/bin/jdtls' },
  root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
  settings = {
    java = { import = { autoImport = true } },
  },
  on_attach = function(client, bufnr)
    jdtls.setup_dap { hotcodereplace = 'auto' }
    jdtls.setup.add_commands()
  end,
}
require('jdtls').start_or_attach(config)
