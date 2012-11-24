Array.class_eval do
  def mean
    (self.inject{|sum,n| sum + n }).to_f/self.size
  end
  
  def median
    sorted_nums = self.sort
    from_left = sorted_nums[(sorted_nums.size-1)/2]
    from_rigth = sorted_nums[(sorted_nums.size)/2]
    from_left == from_rigth ? from_left : [from_left,from_rigth].mean
  end
  
  def mode
    hash_nums = {}
    self.each { |n| hash_nums[n] = hash_nums[n].to_i+1 }
    max_value = hash_nums.values.max
    hash_nums.keys.select{|n| hash_nums[n] == max_value}
  end
end