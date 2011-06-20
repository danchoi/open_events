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

  EVENT_ATTRS = %w( date link title description )
  EVENT_ATTRS.each do |event_attr|
    define_method event_attr.to_sym do |*args, &block|
      instance_variable_set("@#{event_attr}_parser".to_sym, block) 
    end
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
    EVENT_ATTRS.inject({}) do |memo, event_attr|
      memo[event_attr] = instance_variable_get("@#{event_attr}_parser".to_sym).call(n)
      memo
    end
  end

  def parse
    @doc = Nokogiri::HTML.parse(self.html)
    @res = []
    parsed_nodes.map {|n| @res << parsed_event(n) }.compact
  end

end

if __FILE__ == $0
  es = EventScraper.new ARGV.first
  puts es.info
  puts es.parse
end

