# frozen_string_literal: true

# A speed test of different solutions to a Kata from CodeWars:
# https://www.codewars.com/kata/data-reverse/ruby
#
# A stream of data is received and needs to be reversed.
#
# Each segment is 8 bits long, meaning the order of these
# segments needs to be reversed, for example:
#
# 11111111  00000000  00001111  10101010
#  (byte1)   (byte2)   (byte3)   (byte4)
#
# should become:
#
# 10101010  00001111  00000000  11111111
#  (byte4)   (byte3)   (byte2)   (byte1)
#
# The total number of bits will always be a multiple of 8.
#
# The data is given in an array as such:
# [1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,1,0,1,0,1,0]

def stream(num_of_bytes)
  array = []
  (num_of_bytes * 8).times do
    array.push(rand(2))
  end
  array
end

# def data_reverse(data)
#   new_data = []
#   (data.length / 8).times do
#     temp = []
#     8.times do
#       temp.push(data.pop)
#     end
#     new_data += temp.reverse
#   end
#   new_data
# end

def ricks_data_reverse(data)
  new_data = []
  (data.length / 8).times do
    temp = []
    temp.push(data.pop(8))
    new_data += temp.reverse
  end
  new_data
end

def elliotts_data_reverse(data)
  ret = []
  (0..(data.length / 8 - 1)).reverse_each do |byte|
    ret << data[byte * 8, 8]
  end
  ret.flatten
end

def winning_data_reverse(data)
  data.each_slice(8).to_a.reverse.flatten
end

test_array = stream(10_000)

start_time = Time.now
ricks_data_reverse(test_array)
end_time = Time.now

total_time = end_time - start_time
puts "ricks_data_reverse: #{total_time}"

start_time = Time.now
elliotts_data_reverse(test_array)
end_time = Time.now

total_time = end_time - start_time
puts "elliotts_data_reverse: #{total_time}"

start_time = Time.now
winning_data_reverse(test_array)
end_time = Time.now

total_time = end_time - start_time
puts "winning_data_reverse: #{total_time}"
