require 'nokogiri'
require 'open-uri'

class EventScraper
  attr_accessor :doc

  def initialize(path)
    code = File.read(path)
    instance_eval code
  end

  def venue(values={})
    @v ||= values
  end

  attr_reader :v

  def get_html
    @html ||= open(@v[:url], :proxy => nil).read
  rescue
    puts "error for #{@v[:url]}"
    puts $!
  end

  def parse_event(n)
    %w( date link title description ).inject({}) do |memo, field|
      memo[field] = @v[field.to_sym].call(n)
      memo
    end
  end

  def parse
    @doc = Nokogiri::HTML.parse(get_html)
    @v[:nodes][@doc].inject([]) {|m, n| 
      m << parse_event(n) 
    }.compact
  end

end

if __FILE__ == $0
  es = EventScraper.new ARGV.first
  puts es.v
  puts es.parse
end

