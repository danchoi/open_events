require 'cached_html'
require 'nokogiri'

class EventScraper
  include CachedHtml
  attr_accessor :doc

  def initialize
    @doc = Nokogiri::HTML.parse(self.html)
  end

  def html
    @html ||= cached_html(about[:url])
  end

  def parse
    @res = []
    nodes.map {|n|
      @res << event(n)
    }
    @res
  end

  def parse_test
    nodes.each {|n|
      puts n.inner_html
      puts n.inner_text.gsub(/\s{2,}/, ' ').strip
      puts '-' * 80
    }
  end

end

