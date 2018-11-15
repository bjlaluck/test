collection = [2, 7, 9]

puts "iterating over a collection of #{collection.count} items"
collection.each do |item|
  puts "Item before increment: #{item}"
  item.increment!
  puts "Item after increment #{item}"
end
puts "done iterating!"
