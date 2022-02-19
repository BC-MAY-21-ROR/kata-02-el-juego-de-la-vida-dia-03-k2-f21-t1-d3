# frozen_string_literal: true

# Make tamplate class
class Template
  attr_accessor :row, :column, :grid

  def initialize(row, column)
    @row = row
    @column = column
    @grid = generate
  end

  def generate
    grid_template = []
    @row.times do |x|
      grid_template.push([])
      @column.times do
        grid_template[x].push(0)
      end
    end
    grid_template
  end

  def one_line_grid
    @grid.flatten
  end

  def show
    @row.times do |i|
      @column.times do |j|
        print '*' if @grid[i][j] == 1
        print '.' if @grid[i][j] != 1
      end
      puts 
    end
    puts 
  end

end
