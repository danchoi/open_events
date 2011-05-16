require 'event_scraper'

class Villagevanguard < EventScraper

  def about
    { 
      title: 'Village Vanguard',
      url: 'http://villagevanguard.com/html/schedule.html',
      categories: %w(jazz),
      locations: %w(manhattan)
    }
  end

  def nodes
    doc.at('.schedule').css('.sched')
  end

  def event(n)
    return if n.css('p.sched').inner_html =~ /^Monday nights/
    date, title, band = n.inner_html.split('<br>')
    puts title.gsub(/<\/?[^>]*>/, "").split(" ").map! {|word| word.capitalize}.join(" ").to_s
    puts band.gsub(/<\/?[^>]*>/, "").strip unless band.nil?
    {
      date: date,
      title: title.gsub(/<\/?[^>]*>/, "").split(" ").map! {|word| word.capitalize}.join(" ").to_s,
      band: (band.gsub(/<\/?[^>]*>/, "").strip unless band.nil?),
      link: "http://villagevanguard.com/html/schedule.html"
    }
  end
end

