require_relative '../lib/errors.rb'
require_relative '../lib/file.rb'
require 'colorize'

class CheckErrors < Errors
  attr_accessor :messages

  def initialize(file_path)
    super(file_path)
    @messages = []
  end

  private

  def check_max_line_length(line, id)
    text = 'Maximum Line Length, Limit lines to 40 characters.'
    message = "##{file}:#{id + 1}:".colorize(:cyan) + ' Warning: '.colorize(:yellow) + text
    if max_line_length(line)
      messages.push(message)
      return message
    end
    ''
  end

  private

  def check_no_single_line_methods(line, id)
    text = 'No Single-line Methods, Avoid single-line methods.'
    message = "##{file}:#{id + 1}:".colorize(:cyan) + ' Warning: '.colorize(:yellow) + text
    if no_single_line_methods(line)
      messages.push(message)
      return message
    end
    ''
  end

  private

  def check_spaces_braces(line, id)
    text = "Spaces and Braces, No spaces after '(', '[' or before ']', ')'"
    message = "##{file}:#{id + 1}:".colorize(:cyan) + ' Warning: '.colorize(:yellow) + text
    if spaces_braces(line)
      messages.push(message)
      return message
    end
    ''
  end

  private

  def check_camel_case(line, id)
    text = 'CamelCase for Classes, Use CamelCase for classes and modules.'
    message = "##{file}:#{id + 1}:".colorize(:cyan) + ' Error: '.colorize(:red) + text.colorize(:red)
    if camel_case(line)
      messages.push(message)
      return message
    end
    ''
  end

  private

  def check_spaces_operators(line, id)
    text = 'Spaces and Operators, Use spaces around operators, after commas, colons and semicolons.'
    message = "##{file}:#{id + 1}:".colorize(:cyan) + ' Warning: '.colorize(:yellow) + text
    if spaces_operators(line)
      messages.push(message)
      return message
    end
    ''
  end

  private

  def check_balanced_brackets(line, id)
    text = 'Balanced brackets, lacking of pairs.'
    message = "##{file}:#{id + 1}:".colorize(:cyan) + ' Error: '.colorize(:red) + text.colorize(:red)
    if balanced_brackets(line)
      messages.push(message)
      return message
    end
    ''
  end

  public

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
