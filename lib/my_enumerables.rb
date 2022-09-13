module Enumerable
  # Your code goes here
  def my_each_with_index(&code)
    idx = 0
    self.my_each do |i|
      code.call(i, idx)
      idx += 1
    end
    self
  end

  def my_select(&code)
    matches = []
    self.my_each do |i|
      matches.push i if code.call(i)
    end
    matches
  end

  def my_all?(&code)
    matches = true
    self.my_each do |i|
      matches = false unless code.call(i)
    end
    matches
  end

  def my_any?(&code)
    matches = false
    self.my_each do |i|
      matches = true if code.call(i)
    end
    matches
  end

  def my_none?(&code)
    none = true
    self.my_each do |i|
      none = false if code.call(i)
    end
    none
  end

  def my_count(&code)
    if block_given?
      count = 0
      self.my_each do |i|
        count += 1 if code.call(i)
      end
      count
    else
      self.length
    end
  end

  def my_map(&code)
    new_arr = []
    self.my_each do |i|
      new_arr.push(code.call(i))
    end
    new_arr
  end

  def my_inject(total = 0, &code)
    self.my_each do |i|
      total = code.call(total, i)
    end
    total
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each(&code)
    self.length.times do |i|
      code.call(self[i])
    end
    self
  end
end
