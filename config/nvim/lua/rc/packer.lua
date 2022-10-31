------------------------------------------------------------
--- Install packer.nvim
------------------------------------------------------------
local packer_dir = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(packer_dir)) == 1 then
  vim.api.nvim_command("silent !git clone https://github.com/wbthomason/packer.nvim " .. packer_dir)
end

vim.cmd([[packadd packer.nvim]])
