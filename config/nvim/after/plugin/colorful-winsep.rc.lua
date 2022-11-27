local status, colorful_winsep = pcall(require, "colorful-winsep")
if not status then
  return
end

colorful_winsep.setup()
