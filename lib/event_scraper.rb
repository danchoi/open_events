require 'cached_html'
require 'nokogiri'

class EventScraper
  include CachedHtml
  attr_accessor :doc

  def initialize
    @doc = Nokogiri::HTML.parse(self.html)
  end

  def html
    @html ||= cached_html(meta[:url])
  end

  def parse
    @res = []
    nodes.map {|n|
      @res << event(n)
    }
    @res
  end

end

