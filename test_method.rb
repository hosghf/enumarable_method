def my_each(a)
  l=a.length-1
  i=0
  loop do 
  	yield(a[i]) if block_given?
    i+=1
    break if i>l
  end
  a
end

my_each([3,7,9,5]) {|x|puts x}
