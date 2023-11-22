vim.g.mapleader = " "

-- for nvim-tree
vim.g.loaded_netrw = 1
vim.g.netrwPlugin = 1

-- for Neovide
if vim.g.neovide then
  vim.o.guifont = "HackGen Console NF:h12"
  -- Helper function for transparency formatting
  local alpha = function()
    return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
  end
  -- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
  vim.g.neovide_transparency = 0.0
  vim.g.transparency = 0.8
  vim.g.neovide_background_color = "#0f1117" .. alpha()
  vim.g.neovide_floating_blur_amount_x = 10.0
  vim.g.neovide_floating_blur_amount_y = 10.0
  vim.g.neovide_floating_shadow = true
  vim.g.neovide_floating_z_height = 10
  vim.g.neovide_light_angle_degrees = 45
  vim.g.neovide_light_radius = 5
  vim.g.neovide_remember_window_size = true
end
