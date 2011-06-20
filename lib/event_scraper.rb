require 'nokogiri'
require 'open-uri'

class EventScraper
  attr_accessor :doc

  def initialize(path)
    code = File.read(path)
    instance_eval code
  end

  def info(values={})
    @info ||= values
  end

  def nodes(&block)
    @node_finder ||= block
  end

  def event(&block)
    @event_parser ||= block
  end

  def html
    @html ||= open(info[:url]).read
  end

  def doc
    @doc ||= Nokogiri::HTML.parse(html)
  end

  def parsed_nodes
    @parsed_nodes ||= nodes.call
  end

  def parsed_event(n)
    event.call n
  end

  def parse
    @doc = Nokogiri::HTML.parse(self.html)
    @res = []
    parsed_nodes.map {|n|
      @res << parsed_event(n)
    }
    @res.delete_if { |x| x.nil? }
  end

  def parse_test
    parsed_nodes.each {|n|
      puts n.inner_html
      puts n.inner_text.gsub(/\s{2,}/, ' ').strip
      puts '-' * 80
    }
  end
end

if __FILE__ == $0
  es = EventScraper.new ARGV.first
  puts es.info
  es.parse_test
end

