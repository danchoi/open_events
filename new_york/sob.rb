require 'event_scraper'

class Sob < EventScraper

  def about
    { 
      title: 'SOB\'s - Home of Universal Music',
      url: 'http://sobs.com/content/page/calendar',
      categories: %w(music),
      locations: %w(manhattan)
    }
  end

  def nodes
    doc.at('.view-content').css('.item-list')
  end

  def event(n)
    promoter = n.css('.views-field-field-presents-value-1 .field-content div').inner_html
    date = n.css('.views-field-field-date-value .field-content .date-display-single').inner_html
    title = n.css('.views-field-title .field-content a div').inner_html
    link = "http://sobs.com" + n.css('.views-field-title .field-content a').attr('href').to_s
    
    time = ""
    time << n.css('.views-field-field-date-value-1 .field-content div').inner_html.gsub(/<\/?[^>]*>/, "")
    time << " "
    time << n.css('.views-field-field-date-value2 .field-content div').inner_html.gsub(/<\/?[^>]*>/, "")

    {
      title: title,
      link: link,
      date: date,
      time: time
    }
  end
end

