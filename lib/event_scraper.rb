require 'nokogiri'
require 'open-uri'

class EventScraper
  attr_accessor :doc

  def initialize(path)
    code = File.read(path)
    instance_eval code
  end

  # dsl methods

  def info(values={})
    @info ||= values
  end

  def nodes(&block)
    @node_finder = block
  end

  EVENT_ATTRS = %w( date link title description )
  EVENT_ATTRS.each do |event_attr|
    define_method event_attr.to_sym do |*args, &block|
      instance_variable_set("@#{event_attr}_parser".to_sym, block) 
    end
  end

  # processing methods

  def get_html
    @html ||= open(info[:url], :proxy => nil).read
  rescue
    puts "error for #{info[:url]}"
    puts $!
  end

  def parse_event(n)
    EVENT_ATTRS.inject({}) do |memo, event_attr|
      memo[event_attr] = instance_variable_get("@#{event_attr}_parser".to_sym).call(n)
      memo
    end
  end

  def parse
    @doc = Nokogiri::HTML.parse(get_html)
    @res = []
    @node_finder.call(@doc).map {|n| 
      @res << parse_event(n) 
    }.compact
  end

end

if __FILE__ == $0
  es = EventScraper.new ARGV.first
  puts es.info
  puts es.parse
end

