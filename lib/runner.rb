$LOAD_PATH.unshift('boston', 'new_york')

# TODO use opt parse to output HTML fragments for interative development


class Runner
  def initialize(venue)
    require venue
    klass = camelize(venue)
    puts klass 
    parser = Object.const_get(klass).new
    puts parser.about.inspect
    res = parser.parse
    puts res
  end

  # from active support
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
