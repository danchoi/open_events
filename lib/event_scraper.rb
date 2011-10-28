require 'nokogiri'
require 'open-uri'

class EventScraper
  attr_accessor :doc

  def initialize(path)
    code = File.read(path)
    @v = instance_eval( code )
  end

  attr_reader :v

  def get_html
    @html = open(@v[:url], :proxy => nil).read
    @html.gsub!(">" , "> ") # hack to make sure there are spaces separating words
  end

  def parse_event(n)
    %w( date link title ).inject({}) do |memo, field|
      s = @v[:events][field.to_sym].call(n)
      if s.is_a?(String)
        s = s.gsub(/\s+/, ' ')
      end
      memo[field] = s
      memo
    end
  end

  def parse
    @doc = Nokogiri::HTML.parse(get_html)
    @res = [] # may be used in a lambda
    @v[:events][:items].call(@doc).each {|n| 
      @res << parse_event(n) 
    }
    @res.compact
  end

end

if __FILE__ == $0
  es = EventScraper.new ARGV.first
  puts es.v
  puts es.parse
end

