title: 'Brookline Booksmith',
url: 'http://www.brooklinebooksmith.com/events/mainevent.html',
categories: %w(books speakers),
locations: %w(coolidge-corner),
events: {
  items: ->(doc) {
    doc.search('a').
    select {|x| x['href'] =~ %r{^http://www.brooklinebooksmith-shop.com/event/}}.
    map {|x| x.ancestors.detect {|y| y.name == 'tr'}}
  },
  date: ->(x) { x.xpath('./td[2]/p[1]/text()[1]').text },
  link: ->(x) { x.at('a')['href'] },
  title: ->(x) { x.at('strong').inner_text.strip },
  description: ->(x) { x.xpath('.//p[last()]').inner_text }
}
