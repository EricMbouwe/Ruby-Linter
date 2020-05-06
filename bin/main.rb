#!/usr/bin/env ruby
require_relative '../lib/check_errors.rb'
require_relative '../lib/errors.rb'
require_relative '../lib/file.rb'

ce = CheckErrors.new('lib/code.rb')
messages = ce.messages

ce.check_all

if messages.empty?
  puts 'No errors found, 0 offense!'
else
  puts "1 file inspected, #{messages.size} offenses found."
  puts messages
end

# hash.each_with_index do |line, id|
#     line = lines[id]
#     ce.check_max_line_length(line, id)
# end
# hash = ce.desc
# lines = ce.line
# line = hash[3]
# ce.check_max_line_length(line)
# ce.check_all(lines)
