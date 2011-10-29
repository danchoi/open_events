http://brattlefilm.org/category/calendar-2/special-events/

{
  title: 'Brattle Theater Special Events',
  categories: %w(movies),
  locations: %w(harvard-square),
  nodes: -> { @doc.at('#calendarframe').xpath('./div') },
  date: ->(n) { if (n = n.at('.entry-meta'))
      n.inner_text
    else
      @res.last && @res.last[:date]
    end
  },
  title: ->(n) { n.at('.entry-title').inner_text },
  link: ->(n) { n.at('.entry-title a')['href'] },
  description: ->(n) {}
}

