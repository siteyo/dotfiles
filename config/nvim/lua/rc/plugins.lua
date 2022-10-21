return require('packer').startup(function(use)
  -- Packer
  use({ 'wbthomason/packer.nvim', opt = true })
  --- Colorscheme
  use({ "EdenEast/nightfox.nvim", opt = true })
end)
