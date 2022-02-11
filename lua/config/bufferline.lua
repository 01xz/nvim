local bufferline = Core.utils.plugins.require('bufferline')
bufferline.setup({
  options = {
    offsets = {
      {
        filetype = 'NvimTree',
        text = 'File Explorer',
        highlight = 'Directory',
        text_align = 'center',
      },
    },
    always_show_bufferline = false,
  },
})
