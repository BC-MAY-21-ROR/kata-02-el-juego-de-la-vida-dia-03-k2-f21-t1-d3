require 'rspec'
require_relative '../cell.rb'
require_relative '../template.rb'

describe Cell do
    it 'check generate cells' do
        grid = Template.new(4,8)
        cell = Cell.new(grid.grid)
        cell.generate_cells
        expect(grid.one_line_grid.include?(1)).to eq true
    end
    it 'check count neighbours' do
        grid = grid = [[0, 0, 0,0,0,0,0,0],[0, 0, 0,0,1,0,0,0],[0, 0, 0,1,1,0,0,0],[0, 0, 0,0,0,0,0,0]]
        cell = Cell.new(grid)
        expect(cell.count_neighbors.sum).to eq 24
    end    

    it 'check live or die' do
        grid = [[0, 0, 0,0,0,0,0,0],[0, 0, 0,0,1,0,0,0],[0, 0, 0,1,1,0,0,0],[0, 0, 0,0,0,0,0,0]]
        cell = Cell.new(grid)
        cell.count_neighbors
        cell.lives_or_dies
        expect(grid).to eq ([[0, 0, 0,0,0,0,0,0],[0, 0, 0,1,1,0,0,0],[0, 0, 0,1,1,0,0,0],[0, 0, 0,0,0,0,0,0]])
    end  
end

# 00000000
# 00000100
# 00001100
# 00000000

# 00001110
# 00003230
# 00012220
# 00012210