# frozen_string_literal: true

require 'matrix'

# Make cell class
class Cell
  def initialize(grid)
    @grid = grid
  end

  def generate_cells
    @grid.each.with_index do |row, ri|
      row.each.with_index do |_column, ci|
        @grid[ri][ci] = (rand(0..100) > 80 ? 1 : 0)
      end
    end
  end

  def lives_or_dies
    neighbors = count_neighbors
    @grid.size.times do |i|
      @grid[0].size.times do |j|
        if neighbors[i, j] < 2 || neighbors[i, j] > 3
          @grid[i][j] = 0
        elsif neighbors[i, j] == 3
          @grid[i][j] = 1
        end
      end
    end
  end

  def count_neighbors
    neighbors = Matrix.build(@grid.size, @grid[0].size) { 0 }
    @grid.size.times do |i|
      @grid[0].size.times do |j|
        neighbors[i, j] += @grid[i - 1][j - 1] unless i.zero? || j.zero?
        neighbors[i, j] += @grid[i - 1][j] unless i.zero?
        neighbors[i, j] += @grid[i - 1][j + 1] unless j == @grid[0].size - 1 || i.zero?
        neighbors[i, j] += @grid[i] [j - 1] unless j.zero?
        neighbors[i, j] += @grid[i] [j + 1] unless j == @grid[0].size - 1
        neighbors[i, j] += @grid[i + 1][j - 1] unless i == @grid.size - 1 || j.zero?
        neighbors[i, j] += @grid[i + 1][j] unless i == @grid.size - 1
        neighbors[i, j] += @grid[i + 1][j + 1] unless i == @grid.size - 1 || j == @grid[0].size - 1
      end
    end
    neighbors
  end
end
