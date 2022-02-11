local keymap = Core.utils.keymap

-- Options used frequently
local opt_n = { noremap = true, silent = false }
local opt_ns = { noremap = true, silent = true }

-- Set Space as LEADER
keymap('n', '<Space>', '<NOP>', opt_ns)
vim.g.mapleader = ' '

-- Quit:
-- Quit current window
keymap('', 'Q', ':q<CR>', opt_n)
-- Quit all windows
keymap('', '<C-q>', ':qa<CR>', opt_n)

-- Save:
-- Save current buffer
keymap('', 'S', ':w<CR>', opt_n)
-- Save current buffer when insert
keymap('i', '<C-s>', '<ESC>:w<CR>', opt_n)
-- Save all buffers
keymap('', '<C-s>', ':wa<CR>', opt_n)

-- Copy:
-- Make Y to copy till the end of the line
keymap('n', 'Y', 'y$', opt_n)

-- Search:
-- Use '=' for next, '-' for pre
keymap('', '=', 'n', opt_n)
keymap('', '-', 'N', opt_n)
-- Close highlight search
keymap('', '<LEADER><CR>', ':nohlsearch<CR>', opt_n)

-- Indentation
keymap('n', '<', '<<', opt_ns)
keymap('n', '>', '>>', opt_ns)

-- Cursor Movement:
-- J/K keys for 5 times j/k (faster navigation)
keymap('', 'J', '5j', opt_ns)
keymap('', 'K', '5k', opt_ns)
-- H/L will go to the start/end of the line
keymap('', 'H', '0', opt_ns)
keymap('', 'L', '$', opt_ns)
-- Ctrl + h or l will insert at the start/end of the line
keymap('i', '<C-h>', '<ESC>I', opt_ns)
keymap('i', '<C-l>', '<ESC>A', opt_ns)
keymap('v', '<C-h>', '<NOP>', opt_ns)
keymap('v', '<C-l>', '<NOP>', opt_ns)
-- Ctrl + j or k will move down/up the view port
keymap('', '<C-j>', '5<C-e>', opt_n)
keymap('', '<C-k>', '5<C-y>', opt_n)

-- Windows Management:
-- Disable the default s key
keymap('', 's', '<NOP>', opt_ns)
-- Use <SPACE> + w for moving to the next window
keymap('n', '<LEADER>w', '<C-w>w', opt_n)
-- Use <SPACE> + hjkl for moving cursor around the windows
keymap('n', '<LEADER>h', '<C-w>h', opt_n)
keymap('n', '<LEADER>j', '<C-w>j', opt_n)
keymap('n', '<LEADER>k', '<C-w>k', opt_n)
keymap('n', '<LEADER>l', '<C-w>l', opt_n)
-- Resize splits with s + arrow keys
keymap('n', 's<Up>', ':res +5<CR>', opt_n)
keymap('n', 's<Down>', ':res -5<CR>', opt_n)
keymap('n', 's<Left>', ':vertical resize-5<CR>', opt_n)
keymap('n', 's<right>', ':vertical resize+5<CR>', opt_n)
-- Rotate windows horizontally
keymap('n', 'sh', '<C-w>b<C-w>K', opt_n)
-- Rotate windows vertically
keymap('n', 'sv', '<C-w>b<C-w>H', opt_n)

-- Tab Management:
-- Create a new tab with tn
keymap('', 'tn', ':tabe<CR>', opt_n)
keymap('', 'tN', ':tab split<CR>', opt_n)
-- Move around tabs with tj and tk
keymap('', 'tj', ':+tabnext<CR>', opt_n)
keymap('', 'tk', ':-tabnext<CR>', opt_n)
-- Move the tab with th and tl
keymap('', 'th', ':-tabmove<CR> ', opt_n)
keymap('', 'tl', ':+tabmove<CR> ', opt_n)

-- Plugins:
-- toggle float terminal
keymap('n', '<LEADER>f', ':lua Core.plugins.toggleterm.toggle_float()<CR>', opt_ns)
-- toggle nvimtree
keymap('n', '<LEADER>e', ':NvimTreeToggle<CR>', opt_ns)
-- navigate through buffers in order regardless of which mode you are using
keymap('n', 'bj', ':BufferLineCycleNext<CR>', opt_ns)
keymap('n', 'bk', ':BufferLineCyclePrev<CR>', opt_ns)
-- move the current buffer backwards or forwards in the bufferline
keymap('n', 'bh', ':BufferLineMovePrev<CR>', opt_ns)
keymap('n', 'bl', ':BufferLineMoveNext<CR>', opt_ns)
-- sort buffers by language(extension), directory
keymap('n', 'be', ':BufferLineSortByExtension<CR>', opt_ns)
keymap('n', 'bd', ':BufferLineSortByDirectory<CR>', opt_ns)
-- pick & close buffer
keymap('n', 'bp', ':BufferLinePick<CR>', opt_ns)
keymap('n', 'bq', ':BufferLinePickClose<CR>', opt_ns)
