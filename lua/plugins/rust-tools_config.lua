require("rust-tools").setup({

	server = {
		 on_attach = require "lsp-format".on_attach
	}
})
require("rust-tools.inlay_hints").set_inlay_hints()
