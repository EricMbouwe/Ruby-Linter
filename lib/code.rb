module Enumerable
  def my_each
    return to_enum(__method__) unless block_given?
    puts "jgdfhagajkzhfdafznk test test test"

    i = 0
    while i < size
      yield(to_a[i])
      i += 1
    end
    self
  end

  def my_each_with_index
    return to_enum(__method__) unless block_given?

    i = 0
    while i < size
      yield(to_a[i], i)
      i += 1
    end
    self
  end

  def my_select
    return to_enum(__method__) unless block_given?

    result = []
    my_each do |item|
      result << item if yield(item)
    end
    result
  end

  def my_all?(param = nil)
    result = true
    my_each do |value|
      if block_given?
        result = false unless yield(value)
      elsif param.nil?
        result = false unless value
      else
        result = false unless param === value
      end
    end
    result
  end

  def my_any?(param = nil)
    result = false
    my_each do |value|
      if block_given?
        result = true if yield(value)
      elsif param.nil?
        result = true if value
      elsif param === value
        result = true
      end
    end
    result
  end

  def my_none?(param = nil)
    result = true
    my_each do |value|
      if block_given?
        result = false if yield(value)
      elsif param.nil?
        result = false if value
      elsif param === value
        result = false
      end
    end
    result
  end

  def my_count(param = nil)
    count = 0
    my_each do |item|
      if param
        count += 1 if item == param
      elsif block_given?
        count += 1 if yield(item)
      else
        count = length
      end
    end
    count
  end

  def my_map(param = nil)
    return to_enum(__method__) unless block_given?

    arr = []
    my_each do |item|
      if param
        a = param.call(item)
        block_given? ? arr << a : arr
      else
        arr << yield(item)
      end
    end
    arr
  end

  def my_inject(param1 = nil, param2 = nil)
    if block_given?
      my_each do |item|
        param1 = param1.nil? ? to_a[0] : yield(param1, item)
      end
      param1
    elsif param1
      i = param2.nil? ? 1 : 0
      accumulator = param2.nil? ? to_a[0] : param1
      operator = param2.nil? ? param1 : param2

      while i < size
        accumulator = to_a[i].send(operator, accumulator)
        i += 1
      end
      accumulator
    else
      to_enum(__method__)
    end
  end
end

# implementation of my_inject
def multiply_els(arr)
  arr.my_inject('*')
end
