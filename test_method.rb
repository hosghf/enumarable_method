def abc
  puts 'hey'
  yield if block_given?
  puts 'who'
  if block_given?
  	puts 'block is given'
  end
  a=block_given?
  puts a
  a
end

puts abc {puts 'this is block'}