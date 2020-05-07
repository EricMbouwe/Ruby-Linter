#!/usr/bin/env ruby
require_relative '../lib/check_errors.rb'
require_relative '../lib/errors.rb'
require_relative '../lib/file.rb'
require 'colorize'

file_path = ARGV.join('')
ce = CheckErrors.new(file_path)
messages = ce.messages

ce.check_all

if messages.empty?
  puts '1 file inspected, ' + 'No errors found, 0 offense!.'.colorize(:green)
else
  puts '1 file inspected, ' + "#{messages.size} offense(s) ".colorize(:red) + 'found.\n\n'
  puts messages
end

# puts String.colors
