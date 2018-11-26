# frozen_string_literal: true

require 'matrix'

##
# This class represents a custom matrix enumerator
class CustomMatrix < Enumerator

  attr_accessor :matrix

  ##
  # Creates a new enumerator and init it's matrix
  #
  # :args: n - Matrix size = 2n+1
  def initialize(n = 1)
    @matrix = Matrix.build(2 * n + 1) { rand 10 }
  end

  ##
  # Pretty prints matrix in console
  def pretty_print
    puts
    puts "Matrix:\n"
    puts @matrix.to_a.map(&:inspect)
    puts
  end

  def each
    return enum_for(:each) unless block_given?

    c = @matrix.row_count / 2
    x = y = c
    dx = 0
    dy = -1
    step = 0
    (0...@matrix.row_count**2).each do
      if (x == y) && (x == c - step)
        yield(@matrix[x, y])
        step += 1
      elsif ((x >= c - step) && (x <= c + step)) && ((y >= c - step) && (y <= c + step))
        yield(@matrix[x, y])
      else
        x -= dx
        y -= dy
        dx, dy = -dy, dx
        x += dx
        y += dy
        yield(@matrix[x, y])
      end
      x += dx
      y += dy
    end
  end
end