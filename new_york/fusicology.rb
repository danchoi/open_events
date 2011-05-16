require 'event_scraper'

class Fusicology < EventScraper

  def about
    { 
      title: 'Fusicology',
      url: 'http://fusicology.com/eventlist/?fv=all&cid=NYC',
      categories: %w(urban),
      locations: %w(new-york-city queens manhattan bronx brooklyn)
    }
  end

  def nodes
    nodeSet1 = doc.at('.eventlist').css('div.box')
    nodeSet2 = doc.at('.eventlist').css('div.boxcopperHov')
    nodeSet3 = doc.at('.eventlist').css('div.boxorangeHov')
    nodeSet4 = doc.at('.eventlist').css('div.boxlightblueHov')

    nodeSet1 | nodeSet2 | nodeSet3 | nodeSet4
  end

  def event(n)
    link = n.css('.elist_tit_nf a').attr('href')
    title = n.css('.elist_tit_nf a').inner_html
    puts title
  end
end

