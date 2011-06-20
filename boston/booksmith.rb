info title: 'Brookline Booksmith',
     url: 'http://www.brooklinebooksmith.com/events/mainevent.html',
     categories: %w(books speakers),
     locations: %w(coolidge-corner)

nodes {
  doc.search('strong a').
  select {|x| 
    x['href'] =~ %r{^http://www.brooklinebooksmith-shop.com/event/}}.
  map {|x| 
    x.ancestors.detect {|y| y.name == 'tr'}}
}

event {|n| 
  puts n.serialize
  date = n.xpath('./td[2]/p[1]/text()[1]').text
  link = n.at('a')['href']
  title = n.at('strong').inner_text.strip
  description = n.xpath('.//p[last()]').inner_text
  { 
    date: date,
    title: title,
    link: link,
    description: description
  }
}
