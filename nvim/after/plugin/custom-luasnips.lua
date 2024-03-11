local ls = require('luasnip')

-- some shorthands...
local snip = ls.snippet
local text = ls.text_node
local insert = ls.insert_node

ls.add_snippets('ruby', {
  snip({
    trig = 'ppp',
    name = 'Inspect using pretty_inspect',
    dscr = 'Print out any variable-value with an emoji for easier identify.'
  }, {
    text('puts "💭 " * 50'),
    text({ '', 'pp(' }), -- pass a teble instead of string to insert each element in multiple lines
    insert(1, 'params'),
    text(')'),
  }),

  snip({
    trig = 'ppi',
    name = 'Inspect using pretty_inspect',
    dscr = 'Print out any variable-value with a random emoji for easier identify.'
  }, {
    text('a = ["💭", "✅", "❤️", "🚀", "😎", "👻", "👍", "😸", "⭐️", "🚨", "🦋", "🤷🏻‍♂️", "🦄", "🏁", "🐷", "🤷🏻‍♂️", "1️⃣", "☑️"]'),
    text({ '', 'puts a.sample * 50' }),
    text({ '', 'pp(' }),
    insert(1, 'params'),
    text(')'),
  }),

  snip({
    trig = 'bry',
    name = 'Create a break point using binding_pry',
    dscr = 'This will stop code execution at the given line using the pry-byebug/pry-rails gem to start debugging code.'
  }, {
    text('binding.pry')
  }),

  snip({
    trig = 'bbg',
    name = 'Create a break point using byebug',
    dscr = 'This will stop code execution at the given line using the byebug gem to start debugging code.'
  }, {
    text('byebug')
  }),
})

ls.add_snippets(nil, {
  eruby = {
    snip({
      trig = '%',
      namr = 'ERB executable line',
      dscr = 'Create a new executable Ruby line inside an ERB view file.',
    }, {
      text('<% '),
      insert(1, 'statement_to_execute'),
      text(' %>'),
    }),

    snip({
      trig = '#',
      namr = 'ERB comment',
      dscr = 'Create a new commentable line in an ERB view file.',
    }, {
      text('<%# '),
      insert(1, 'statement_to_print'),
      text(' %>'),
    }),
  },
})
