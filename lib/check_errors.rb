require_relative '../lib/errors.rb'
require_relative '../lib/files.rb'

class CheckErrors < Errors
    attr_accessor :messages

    def initialize(file_path)
        super(file_path)
        @messages = []
    end

    def check_max_line_length(line, id)
        message = "#file.rb:#{id}: line too long, max length: 40."
        if max_line_lenght(line)
            messages.push(message)
            return message
        end
        'good length'
    end

    def check_no_single_line_methods
    end

    def check_two_or_ore_empty_lines
    end

    def check_spaces_braces
    end

    def check_camel_case
    end

    def check_spaces_operators
    end

    def check_empty_lines_around_bodies
    end

    def check_all
        desc.each_with_index do |line, id|
            line = desc[id]
            check_max_line_length(line, id)
        end
    end
end

# ce = CheckErrors.new('lib/code.rb')
# puts ce.inspect
# er = Errors.new('lib/code.rb')
# puts er.inspect