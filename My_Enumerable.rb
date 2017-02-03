module Enumerable
  def my_each
      l=self.length-1
      i=0
        loop do 
  	      yield(self[i]) if block_given?
          i+=1
          break if i>l
        end
      self
  end
end

module Enumerable
  def my_each_index
      l=self.length-1
      i=0
        loop do 
  	      yield(self[i],i) if block_given?
          i+=1
          break if i>l
        end
      self
  end
end

module Enumerable
  def my_select
  	a=[]
    i=0 
    l=self.length-1
      loop do 
        w=yield(self[i])
        if w==true
          a.push(self[i])
        end
        i+=1
      break if i>l
    end  
    a
  end
end

module Enumerable
  def my_select2
  	a=[]
    self.my_each do |x|
      w=yield(x) 
      if w==true
        a.push(x)
      end
    end
    a
  end
 end

  module Enumerable
    def my_all?
      l=self.length-1
      i=0
   	  loop do
   	  	break if i>l
 	    w=yield(self[i])
 	    if w==false
 	      return false
 	    end
 	    i+=1
      end
      true
    end
  end

  module Enumerable
  	def my_any?
  	  self.my_each do |x|
  	  	w=yield(x)
  	  	if w==true
  	  	  return true,x
  	  	end
  	  end 
  	  false
  	end
  end

  module Enumerable
    def my_none?
      self.my_each do |x|
      	w=yield(x)
      	if w==true
      	  return false
      	end
      end
      true
    end
  end

  module Enumerable
    def my_count(a=nil)
      l=self.length-1
      i=0
      x=0
      if (a==nil and block_given?)
      	loop do 
      	  break if i>l
      	  w=yield(self[i])
      	  if w==true
      	  	x+=1
      	  end
      	  i+=1
      	end
      	return x
      elsif a!=nil
      	loop do 
      	  break if i>l
          if self[i]==a
            x+=1
          end
          i+=1
      	end
      	return x
      else
      	return self.length
      end
    end
  end

  module Enumerable
  	def my_map
  	  l=self.length-1
  	  i=0
  	  loop do
  	    break if i>l 
  	  	z=yield(self[i])
  	  	self[i]=z
  	  	i+=1
  	  end	
  	  self
  	end
  end

  module Enumerable
  	def my_inject(a=nil)

  	  if a!=nil
  	    i=0
  	    l=self.length-1
  	    loop do 
  	  	  break if i>l 
  	  	  w=yield(a,self[i])
  	  	  a=w 
  	  	  i+=1
  	    end
  	    a
      end

      if a==nil
        a=self[0]
        i=1
        l=self.length-1
        loop do 
          break if i>l 
          w=yield(a,self[i])
          a=w 
          i+=1
        end
        a
      end
      a
  	end
  end

    module Enumerable
    def my_map2(myproc)
      l=self.length-1
      i=0
      loop do
        break if i>l 
        z = myproc.call(self[i])
        self[i]=z
        i+=1
      end 
      self
    end
  end

  module Enumerable
    def my_map3(myproc=nil)
      l=self.length-1
      i=0

      if myproc != nil
        loop do
          break if i>l 
          z = myproc.call(self[i])
          self[i]=z
          i+=1
        end 
        self
      elsif block_given?
        loop do
          break if i>l 
          z = yield(self[i])
          self[i]=z
          i+=1
        end 
        self
      end  
    end

  end

  /def multiply_els(a)
  	a.my_inject() {|memo,obj| memo*obj }
  end

  x=multiply_els([2,4,5])
  puts x
  

z=[5,7,8,3,2].my_each_index {|x,y| puts x.to_s+' '+y.to_s}
puts z.inspect

z=[7,6,3,5,1,9,12,8].my_select {|x|  x.even? }
puts z.inspect

z=[4,5,8,12,2,4,6,8].my_select2 {|x| x.even?}
puts z.inspect

z=[6,2,88,10,8,88,66,22,33].my_all {|x| x.even? }
puts z

z=[5,10,2,1,9].my_any? {|x| x.even?}
puts z.inspect

z=[3,5,7,6].my_none? {|x| x.even?}
puts z

z=[5,3,6,8,2,2,2].my_count {|x| x.even?}
puts z

z=[4,2,7,6,5].my_map {|x| x*2}
puts z
/
z=[5,6,7,8].my_inject() {|memo,obj| memo+obj}
puts z

z=[5,6,7,8].my_inject([]) do |memo,obj| 
   memo<< obj if obj % 2 == 0
   memo
end
puts z.inspect 

z=[1,8].my_inject() { |a,b| a+b }
puts z

puts '-------------'

z=Proc.new { |x| x + 10 }
a=[3,5,2,7].my_map2(z)
puts a

puts '------ map3-------'

a=[3,5,7,8,22,88,90].my_map3(z) {|x| x+=8}
puts a




