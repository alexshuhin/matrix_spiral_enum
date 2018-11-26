# frozen_string_literal: true

require './lib/custom_matrix'

puts "Input 'n' value for 2n+1 matrix:"
n = gets.to_i
puts 'Input limit value for enumerator output:'
limit = gets.to_i

matrix = CustomMatrix.new(n)
matrix.pretty_print

all_items = 'All items:'
matrix.select { |m| all_items += " #{m}" }
puts all_items

limited_items = 'Limited items:'
matrix.lazy.select { |m| limited_items += " #{m}" }.first(limit)
puts limited_items

even_items = 'Even limited items:'
matrix.lazy.select { |m| even_items += " #{m}" if m.even? }.first(limit)
puts even_items