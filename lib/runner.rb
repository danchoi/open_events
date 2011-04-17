$LOAD_PATH.unshift('scrapers')

class Runner
  def initialize(venue)
    require venue
    klass = camelize(venue)
    puts klass 
    res = eval(klass).new.parse
    puts res
  end

  def camelize(lower_case_and_underscored_word, first_letter_in_uppercase = true)
    if first_letter_in_uppercase
      lower_case_and_underscored_word.to_s.gsub(/\/(.?)/) { "::#{$1.upcase}" }.gsub(/(?:^|_)(.)/) { $1.upcase }
    else
      lower_case_and_underscored_word.to_s[0].chr.downcase + camelize(lower_case_and_underscored_word)[1..-1]
    end
  end
end

if __FILE__ == $0
  Runner.new(ARGV.first)
end
