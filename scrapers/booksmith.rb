require 'event_scraper'

class Booksmith < EventScraper

  def meta
    { 
      title: 'Brookline Booksmith',
      url: 'http://www.brooklinebooksmith.com/events/mainevent.html',
      categories: %w(books speakers),
      locations: %w(coolidge-corner)
    }
  end

  def nodes
    doc.search('strong a').
      select {|x| 
        x['href'] =~ %r{^http://www.brooklinebooksmith-shop.com/event/}}.
      map {|x| 
        x.ancestors.detect {|y| y.name == 'tr'}
      }
  end

  def event(n)
    return n.inner_html
    date = if (x = n.at('.entry-meta'))
             x.inner_text
           else
             @res.last && @res.last[:date]
           end
    time = (x = n.at('li/text()')) && x.text.strip
    link = n.at('.entry-title a')['href']
    { 
      date: date,
      time: time,
      title: n.at('.entry-title').inner_text,
      link: link 
    }
  end
end

