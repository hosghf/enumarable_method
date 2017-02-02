module Enumerable
  def my_each
      l=self.length-1
      i=0
        loop do 
  	      yield(self[i]) if block_given?
          i+=1
          break if i>l
        end
        a
  end
end

[5,7,8,3,2].each {|x| puts x}