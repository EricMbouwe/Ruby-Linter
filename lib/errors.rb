class Errors
    attr_reader errors
    def initialize
        @errors = []
    end

    def max_line_lenght(line)
        line.size > 40
    end

    def no_single_line_methods
    end

    def two_or_ore_empty_lines
    end

    def spaces_braces
    end

    def camel_case
    end

    def spaces_operators
    end

    def empty_lines_around_bodies
    end

    def balanced_brackets(line)
        stack = []
        line.each do |ele|
            if ele include?("(", "{", "[")
              stack.push(ele) 
            else  
                unless stack
                    return False
                end
                current_ele = stack.pop() 
                if current_ele == '('
                    unless ele == ")"
                        return False
                    end
                elsif current_ele == '{'
                    unless ele == "}"
                        return False
                    end
                elsif current_ele == '['
                    unless ele == "]"
                        return False
                    end
                end
            end
            if stack
                return False
            end
        end
        return True
    end
end