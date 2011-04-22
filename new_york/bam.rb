require 'event_scraper'

class Bam < EventScraper

  def about
    { 
      title: 'Brooklyn Academy of Music',
      url: 'http://bam.org/view.aspx?pid=6',
      categories: %w(general-events),
      locations: %w(brooklyn)
    }
  end

  def nodes
    doc.at('.calendar-main').xpath('//tr')
  end

  def event(n)
    # filter out nil elements
    unless n.css('.eventTitle').first.nil?
      current_spot = n.css('.eventTitle').first.first_element_child
      type = current_spot.inner_html.strip
      current_spot = current_spot.next_element
      link =  "http://bam.org/" + current_spot.css('a').first.attr('href')
      title = current_spot.css('a').inner_html
      current_spot = current_spot.next_element
      location = current_spot.inner_html.strip
      current_spot = current_spot.next_element
      date = current_spot.inner_html.strip

      {
        type: type,
        title: title,
        location: location,
        link: link,
        date: date
      }
    end
  end
end

