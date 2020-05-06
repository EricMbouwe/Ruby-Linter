require_relative '../lib/file.rb'

class Errors < Files
  def initialize(file_path)
    super(file_path)
  end

  def max_line_length(line)
    line_length(line) > 40
  end

  def no_single_line_methods(line)
    data = one_line_data_word(line)
    data.include?('def') && data.include?('end')
  end

  def spaces_braces(line)
  end

  def camel_case(line)
  end

  def spaces_operators(line)
  end

  def balanced_brackets(line)
    stack = []
    data = one_line_data_char(line)
    data.each do |ele|
      if ele.include?('(') || ele.include?('{') || ele.include?('[')
        stack.push(ele)
      else
        unless stack
          return false
        end

        current_ele = stack.pop()
        if current_ele == '('
          unless ele == ')'
            return false
          end
        elsif current_ele == '{'
          unless ele == '}'
            return false
          end
        elsif current_ele == '['
          unless ele == ']'
            return false
          end
        end
      end
      if stack
        return false
      end
    end
    return true
  end
end
