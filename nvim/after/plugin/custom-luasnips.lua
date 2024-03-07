local ls = require('luasnip')

-- some shorthands...
local snip = ls.snippet
local text = ls.text_node
local insert = ls.insert_node

ls.add_snippets('ruby', {
  snip('ppp', {
    text('puts "💭 " * 50'),
    text({ '', 'pp(' }), -- pass a teble instead of string to insert each element in multiple lines
    insert(1, 'params'),
    text(')'),
  }),

  snip('ppi', {
    text('a = ["💭", "✅", "❤️", "🚀", "😎", "👻", "👍", "😸", "⭐️", "🚨", "🦋", "🤷🏻‍♂️", "🦄", "🏁", "🐷", "🤷🏻‍♂️", "1️⃣", "☑️"]'),
    text({ '', 'puts a.sample * 50' }),
    text({ '', 'pp(' }),
    insert(1, 'params'),
    text(')'),
  }),

  snip('bry', {
    text('binding.pry')
  }),

  snip('bbg', {
    text('byebug')
  }),
})
