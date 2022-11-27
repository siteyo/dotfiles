local status, comment = pcall(require, "Comment")
if not status then
  return
end

comment.setup({
  pre_hook = function()
    return require("ts_context_commentstring.internal").calculate_commentstring()
  end,
})
