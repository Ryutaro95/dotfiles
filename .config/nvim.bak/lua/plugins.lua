local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
      fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
      vim.cmd [[packadd packer.nvim]]
      return true
    end
    return false
end

local packer_bootstrap = ensure_packer()
-- vim.cmd.packadd "packer.nvim"

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- Theme
    use {
        'svrana/neosolarized.nvim',
        branch = 'main',
        requires = { 'tjdevries/colorbuddy.nvim' }
    }
    use 'navarasu/onedark.nvim'

	use {
		'windwp/nvim-autopairs',
	}
    use { 'catppuccin/nvim', as = 'catppuccin' }

    use {
        'nvim-neo-tree/neo-tree.nvim',
        branch = 'main',
        requires = {
          'nvim-lua/plenary.nvim',
          'kyazdani42/nvim-web-devicons',
          'MunifTanjim/nui.nvim',
        },
        config = function ()
          require('plugins.neo-tree')
        end
    }

    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
	use { 'nvim-telescope/telescope-file-browser.nvim' }

    -- インデント可視化
    -- アニメーションでインデントを可視化出来るmini.indentscopeをお試し中
    -- use 'lukas-reineke/indent-blankline.nvim'
    use { 'echasnovski/mini.nvim', branch = 'stable' }

    use {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!:).
        run = "make install_jsregexp"
    }
    use { "rafamadriz/friendly-snippets" }

    use {
        'numToStr/Comment.nvim',
    }

    use ''

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- Git
    use {
        'lewis6991/gitsigns.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
    }

    -- LSP
    use 'neovim/nvim-lspconfig'
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'
	use "jose-elias-alvarez/null-ls.nvim"
   	use "jayp0521/mason-null-ls.nvim"

    -- cmp
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    --
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'

	-- Terminal
	use {
		'akinsho/toggleterm.nvim',
		tag = '*'
	}

	-- Status line
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	use { 'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons' }

	-- Go
	use { 'fatih/vim-go', opt = true, ft = { 'go' } }

	use 'phaazon/hop.nvim'

    if packer_bootstrap then
        require('packer').sync()
    end
end)
