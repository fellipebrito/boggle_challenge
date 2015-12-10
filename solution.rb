require 'matrix'
require "#{File.expand_path(File.dirname(__FILE__))}/array.rb"

# Solving the problem https://gist.github.com/scottburton11/a2d8afcee57d13232ed4
class Solution
  attr_accessor :rows

  def initialize(length = 5)
    @rows = generate_grid length
  end

  def generate_grid(n)
    (0...n).map { generate_string n }
  end

  def generate_string(n)
    (0...n).map { (65 + rand(26)).chr }.join
  end

  def word?(word)
    `grep -i "^#{word}$" /usr/share/dict/american-english`.length > 0 ||
      `grep -i "^#{word.reverse}$" /usr/share/dict/american-english`.length > 0
  end

  def matrix
    Matrix.rows(rows.map { |l| l.split(//) })
  end

  def columns
    matrix.column_vectors.map { |v| v.to_a.join }
  end

  def diagonals
    matrix.to_a.diagonals.map(&:join)
  end

  def words_found
    ([] << rows << columns << diagonals).flatten
      .select { |w| w.length > 2 }
      .select { |w| word? w }
  end
end
