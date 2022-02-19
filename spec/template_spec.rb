require 'rspec'
require_relative '../template.rb' 

describe Template do
    it 'check grid size' do
        template = Template.new(3,8)
        template.generate
        expect(template.one_line_grid.size).to eq 24
    end

    it 'check grid size of column' do
        template = Template.new(3,8)
        expect(template.generate[0].size).to eq 8
    end
end