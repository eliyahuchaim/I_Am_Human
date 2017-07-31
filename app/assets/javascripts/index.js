const store = {categories: [], tags: [], thoughts: [], comments: [], users: []}

function render(html, into){
  $(into).empty()
  $(into).append(html)
}

$(() => {





})

function render(html, where) {
  $(where).empty()
  $(html).appendTo(where)
}
