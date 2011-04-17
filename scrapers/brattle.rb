require 'event_scraper'

class Brattle < EventScraper

  def meta
    { 
      title: 'Brattle Theater Special Events',
      url: 'http://brattlefilm.org/category/calendar-2/special-events/'
    }
  end

  def nodes
    doc.at('#calendarframe').xpath('./div')
  end

  def event(node)
    date = if (x = node.at('.entry-meta'))
             x.inner_text
           else
             @res.last && @res.last[:date]
           end
    link = node.at('.entry-title a')['href']
    { 
      date: date,
      title: node.at('.entry-title').inner_text,
      link: link 
    }
  end


  def parse_test
    nodes.each {|n|
      puts n.inner_html
      puts n.inner_text.gsub(/\s{2,}/, ' ').strip
      puts '-' * 80
    }
  end

end

if __FILE__ == $0
  puts Brattle.new.parse
end
