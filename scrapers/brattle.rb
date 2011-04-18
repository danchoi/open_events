require 'event_scraper'

class Brattle < EventScraper

  def about
    { 
      title: 'Brattle Theater Special Events',
      url: 'http://brattlefilm.org/category/calendar-2/special-events/',
      categories: %w(movies),
      locations: %w(harvard-square)
    }
  end

  def nodes
    doc.at('#calendarframe').xpath('./div')
  end

  def event(n)
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

