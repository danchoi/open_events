http://www.brooklinebooksmith.com/events/mainevent.html

{
  title: 'Brookline Booksmith',
  categories: %w(books speakers),
  locations: %w(coolidge-corner),
  nodes: -> {
    @doc.search('a').
    select {|x| x['href'] =~ %r{^http://www.brooklinebooksmith-shop.com/event/}}.
    map {|x| x.ancestors.detect {|y| y.name == 'tr'}}
  },
  date: ->(n) { n.xpath('./td[2]/p[1]/text()[1]').text },
  link: ->(n) { n.at('a')['href'] },
  title: ->(n) { n.at('strong').inner_text.strip },
  description: ->(n) { n.xpath('.//p[last()]').inner_text }
}

