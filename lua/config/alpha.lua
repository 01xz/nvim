local alpha = Core.utils.plugins.require('alpha')
local startify = require('alpha.themes.startify')
startify.nvim_web_devicons.enabled = false
startify.config.opts.noautocmd = true
startify.section.header.val = {
  [[       __      _                         ]],
  [[     /'__`\  /' \                        ]],
  [[    /\ \/\ \/\_, \   __  _  ____         ]],
  [[    \ \ \ \ \/_/\ \ /\ \/'\/\_ ,`\       ]],
  [[     \ \ \_\ \ \ \ \\/>  </\/_/  /_      ]],
  [[      \ \____/  \ \_\/\_/\_\ /\____\     ]],
  [[       \/___/    \/_/\//\/_/ \/____/     ]],
  [[                                         ]],
  [[ _______________________________________ ]],
  [[/ Don't get suckered in by the comments \]],
  [[| -- they can be terribly misleading.   |]],
  [[| Debug only code.                      |]],
  [[|                                       |]],
  [[\ -- Dave Storer                        /]],
  [[ --------------------------------------- ]],
  [[        \   ^__^                         ]],
  [[         \  (oo)\_______                 ]],
  [[            (__)\       )\/\             ]],
  [[                ||----w |                ]],
  [[                ||     ||                ]],
}
-- disable mru
startify.section.mru.val = { { type = 'padding', val = 0 } }
-- change mru_cwd items
startify.section.mru_cwd.val = {
  { type = 'padding', val = 1 },
  { type = 'text', val = 'MRU ' .. vim.fn.getcwd(), opts = { hl = 'SpecialComment', shrink_margin = false } },
  { type = 'padding', val = 1 },
  {
    type = 'group',
    val = function()
      return { startify.mru(0, vim.fn.getcwd(), 5) }
    end,
    opts = { shrink_margin = false },
  },
}
alpha.setup(startify.config)
