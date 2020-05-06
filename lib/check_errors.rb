require_relative '../lib/errors.rb'
require_relative '../lib/file.rb'

class CheckErrors < Errors
  attr_accessor :messages

  def initialize(file_path)
    super(file_path)
    @messages = []
  end

  def check_max_line_length(line, id)
    message = "##{file}:#{id + 1}: Maximum Line Length, Limit lines to 40 characters."
    if max_line_length(line)
      messages.push(message)
      return message
    end
    'good length'
  end

  def check_no_single_line_methods(line, id)
    message = "##{file}:#{id + 1}: No Single-line Methods, Avoid single-line methods."
    if no_single_line_methods(line)
      messages.push(message)
      return message
    end
    ''
  end

  def check_spaces_braces(line, id)
    message = "##{file}:#{id + 1}: Spaces and Braces, No spaces after (, [ or before ], ) Use spaces around { and before }."
    if spaces_braces(line)
      messages.push(message)
      return message
    end
    ''
  end

  def check_camel_case(line, id)
    message = "##{file}:#{id + 1}: CamelCase for Classes, Use CamelCase for classes and modules."
    if camel_case(line)
      messages.push(message)
      return message
    end
    ''
  end

  def check_spaces_operators(line, id)
    message = "##{file}:#{id + 1}: Spaces and Operators, Use spaces around operators, after commas, colons and semicolons."
    if spaces_operators(line)
      messages.push(message)
      return message
    end
    ''
  end

  def check_balanced_brackets(line, id)
    message = "##{file}:#{id + 1}: Balanced brackets, lacking of pair."
    if balanced_brackets(line)
      messages.push(message)
      return message
    end
    ''
  end

  def check_all
    desc.each_with_index do |line, id|
      line = desc[id]
      check_max_line_length(line, id)
      check_no_single_line_methods(line, id)
      check_spaces_braces(line, id)
      check_camel_case(line, id)
      check_spaces_operators(line, id)
      check_balanced_brackets(line, id)
    end
  end
end

# ce = CheckErrors.new('lib/code.rb')
# puts ce.inspect
# er = Errors.new('lib/code.rb')
# puts er.inspect
