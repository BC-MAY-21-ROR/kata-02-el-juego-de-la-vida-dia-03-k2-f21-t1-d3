require './template.rb'
require './cell.rb'
 @gen = 0
def main_loop(tem, cel)
    puts "Generation: #{@gen += 1}"
    tem.show
    cel.lives_or_dies
    if gets.chomp.empty? && tem.one_line_grid.include?(1)
        main_loop(tem,cel)
    else
        puts "Generation: #{@gen += 1}"
        tem.show
    end
end

puts 'Please type the numbers of rows'
row = gets.to_i
puts 'Please type the numbers of columns'
column = gets.to_i

template = Template.new(row, column)
cell = Cell.new(template.grid)
cell.generate_cells

main_loop(template, cell)