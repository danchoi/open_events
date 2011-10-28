title: 'Brattle Theater Special Events',
url: 'http://brattlefilm.org/category/calendar-2/special-events/',
categories: %w(movies),
locations: %w(harvard-square),
events: {
  items: ->(doc) { doc.at('#calendarframe').xpath('./div') },
  date: ->(x) { if (x = x.at('.entry-meta'))
      x.inner_text
    else
      @res.last && @res.last[:date]
    end
  },
  title: ->(x) { x.at('.entry-title').inner_text },
  link: ->(x) { x.at('.entry-title a')['href'] },
  description: ->(x) {}
}
