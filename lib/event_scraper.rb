require 'nokogiri'
require 'open-uri'

class EventScraper
  attr_accessor :doc

  def initialize(path)
    codelines = File.readlines(path)
    @url = codelines.shift
    @html = open(@url, :proxy => nil).read
    @html.gsub!(">" , "> ") # hack to make sure there are spaces separating words
    code = codelines.join("\n")
    code = "$SAFE = 2 ;  #{code} "
    @v = instance_eval( code )
  end

  attr_reader :v

  def parse_event(n)
    %w( date link title ).inject({}) do |memo, field|
      s = @v[field.to_sym].call(n)
      if s.is_a?(String)
        s = s.gsub(/\s+/, ' ')
      end
      memo[field] = s
      memo
    end
  end

  def parse
    parser = @v[:format] == :xml ? Nokogiri::XML : Nokogiri::HTML
    @doc = parser.parse @html
    @res = [] # may be used in a lambda
    @v[:nodes].call().each {|n| 
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

