require_relative '../lib/file.rb'

class Errors < Files

  def initialize(file_path)
    super(file_path)
  end

  private

  def max_line_length(line)
    line_length(line) > 40
  end

  private

  def no_single_line_methods(line)
    data = one_line_data_words(line)
    data.include?('def') && data.include?('end')
  end

  private

  def spaces_braces(line)
    data = one_line_data_chars(line)
    data.include?("(")
  end

  private

  def camel_case(line)
  end

  private

  def spaces_operators(line)
  end

  private

  def balanced_brackets(line)
    stack = []
    data = one_line_data_chars(line)
    data.each do |ele|
      if ele.include?('(') || ele.include?('{') || ele.include?('[')
        stack.push(ele)
      end
    end
  end
  
end
