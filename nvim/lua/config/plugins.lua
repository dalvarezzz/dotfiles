require("packer").startup(function(use)
    use("wbthomason/packer.nvim")
    use("neovim/nvim-lspconfig")
    use {
        "hrsh7th/nvim-cmp",
        setup = require("plugins.cmp")
    }
    use("hrsh7th/cmp-nvim-lsp")
    use("saadparwaiz1/cmp_luasnip")
    use("L3MON4D3/LuaSnip")
    use {
        "rust-lang/rust.vim",
        opt = true,
    }
    use("tpope/vim-commentary") -- https://github.com/tpope/vim-commentary
    -- colorscheme
    use({
        "ellisonleao/gruvbox.nvim",
    })
    use("EdenEast/nightfox.nvim") -- colorscheme
    use {
        "nvim-treesitter/nvim-treesitter", ["do"] = "TSUpdate",
        setup = require("plugins.treesitter")

    }
    use("nvim-lua/plenary.nvim")
    use {
        "nvim-telescope/telescope.nvim",
        setup = require("plugins.telescope")
    }
    use {
        "windwp/nvim-autopairs",
        setup = require("plugins.autopairs")
    }
    use {
        "nvim-lualine/lualine.nvim",
        requires = {
            "kyazdani42/nvim-web-devicons",
            opt = true,
        },
        setup = require("plugins.lualine")
    }
end)

require("plugins.lspconfig")
