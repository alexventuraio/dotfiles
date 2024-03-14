return {
  'folke/todo-comments.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    keywords = {
      FROM = { icon = ' ', color = 'from' },
      TEST = { color = 'test' },
    },
    colors = {
      from = { '#DFFF00' },
      white = { '#ECF0F1' },
      test = { '#FF7F50' },
    },
  }
}

-- FIX: alt = FIXME, BUG, FIXIT, ISSUE
-- TODO:
-- HACK:
-- WARN: alt = WARNING, XXX
-- PERF: alt = OPTIM, PERFORMANCE, OPTIMIZE
-- NOTE: alt = INFO
-- TEST: alt = TESTING, PASSED, FAILED
-- FROM:
