# テキストでLOVEのピラミッドを作る
n = 5
replacement = "LOVE"

width = 2 * n * replacement.length
n.times do |i|
  puts (replacement * (2 * i + 1)).center(width)
end

puts "Happy Ruby Release Anniversary Day!"