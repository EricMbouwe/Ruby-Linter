require_relative '../lib/file.rb'

class Errors < Files

  def initialize(file_path)
    super(file_path)
  end

  def max_line_length(line)
    line_length(line) > 40
  end

  def no_single_line_methods(line)
    data = one_line_data_words(line)
    data.include?('def') && data.include?('end')
  end

  # def spaces_braces(line)
  #   bad = true
  #   data = one_line_data_chars(line)
  #   if data.include?('(') || data.include?(')') || data.include?('[') || data.include?(']')
  #     data.each_with_index do |char, id|
  #       if char == '(' || char == '[' && data[id + 1] = ''
  #         bad
  #       elsif char == ')' || char == ']' && data[id - 1] = ''
  #         bad
  #       end
  #     end
  #   elsif data.include?('{') || data.include?('}')
  #     data.each_with_index do |char, id|
  #       if char == '{' && data[id + 1] = ''
  #         bad = false
  #       elsif char == '}' && data[id - 1] = ''
  #         bad = false
  #       end
  #     end
  #   end
  #   bad
  # end

  def spaces_braces(line)
    data = one_line_data_chars(line)
    data.include?("(")
  end

  def camel_case(line)
  end

  def spaces_operators(line)
  end

  def balanced_brackets(line)
    stack = []
    data = one_line_data_chars(line)
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
