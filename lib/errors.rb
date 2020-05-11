require_relative '../lib/file.rb'

class Errors < Files
  def initialize(file_path)
    super(file_path)
  end

  def max_line_length(line)
    line_length(line) > 50
  end

  def no_single_line_methods(line)
    data = one_line_data_words(line)
    data.include?('def') && data.include?('end')
  end

  def spaces_braces(line)
    lz = line.size - 1
    i = 0
    if line.include?('[') || line.include?('(') || line.include?(']') || line.include?(')') || line.include?('{') || line.include?('}')
      while i < lz
        if line[i] == '[' || line[i] == '('
          return true if line[i + 1] == ' '
        elsif line[i] == ']' || line[i] == ')'
          return true if line[i - 1] == ' '
        elsif line[i] == '{'
          return true if line[i + 1] != ' '
        elsif line[i] == '}'
          return true if line[i - 1] != ' '
        end
        i += 1
      end
    end
    false
  end

  def camel_case(line)
    data = one_line_data_words(line)
    classname = data[1]
    if data[0] == 'class'
      return true if classname[0].downcase
    end
    false
  end

  def spaces_operators(line)
    lz = line.size - 1
    i = 0
    if line.include?('+') || line.include?('-') || line.include?('*') || line.include?(',') || line.include?('=') || line.include?('==')
      while i < lz
        if line[i] == '+' || line[i] == '-' || line[i] == '=' || line[i] == '=='
          return true if line[i + 1] != ' ' || line[i - 1] != ' '
        elsif line[i] == ','
          return true if line[i + 1] != ' '
        elsif line[i] == '*' || line[i] == '**'
          return true if line[i + 1] == ' ' || line[i - 1] == ' '
        end
        i += 1
      end
    end
    false
  end

  def balanced_brackets(line)
    data = one_line_data_chars(line)
    stack = []
    lz = data.size - 1
    i = 0
    if data.include?('[') || data.include?('(') || data.include?(']') || data.include?(')') || data.include?('{') || data.include?('}')
      while i < lz
        if data[i] == '['
          stack.push(data[i])
        end
        if data[i] == ']'
          if stack.include?('[')
            stack.pop
            return true
          end
        end
      end
    end
    false
  end
end
