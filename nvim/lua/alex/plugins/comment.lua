return {
  'numToStr/Comment.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = true, -- runs require('Comment').setup()
}

-- 🔥 Usage
-- https://github.com/numToStr/Comment.nvim?tab=readme-ov-file#-usage
--
-- NORMAL mode
-- `gcc` - Toggles the current line using linewise comment
-- `gbc` - Toggles the current line using blockwise comment
--
-- VISUAL mode
-- `gc` - Toggles the region using linewise comment
-- `gb` - Toggles the region using blockwise comment
