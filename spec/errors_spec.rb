require_relative '../lib/errors.rb'

RSpec.describe ErrorMethods do
  include ErrorMethods
  describe '#max_line_length' do
    let(:line) { 'capitalize, make your move (line)' }
    let(:line1) { 'capitalize, make your move and let the your oponent make his too' }

    it 'compare the line length to the limit numbers of characters per line' do
      expect(max_line_length(line)).to be(false)
    end
    it 'compare the line length to the limit numbers of characters per line' do
      expect(max_line_length(line1)).to be(true)
    end
  end

  describe '#no_single_line_methods' do
    let(:line) { ' def capitalize, make your move (line)' }
    let(:line1) { 'def capitalize, make your move (line) end' }

    it 'checks if the line contains a Single-line Methods' do
      expect(no_single_line_methods(line1)).to be(true)
    end
    it 'checks if the line contains a Single-line Methods' do
      expect(no_single_line_methods(line)).not_to be(true)
    end
  end

  describe '#spaces_braces' do
    let(:line) { 'capitalize, make your move (line)' }
    let(:line1) { 'capitalize, make your move ( line )' }

    it "checks if there is space after or before '(', '[', ']', ')'" do
      expect(spaces_braces(line1)).to be(true)
    end
    it "checks if there is space after or before '(', '[', ']', ')'" do
      expect(spaces_braces(line)).not_to be(true)
    end
  end

  describe '#camel_case' do
    let(:line1) { 'class capitalize, make your move (line)' }
    let(:line) { 'class Capitalize, make your move (line)' }

    it 'checks the usage of CamelCase when naming a class and module' do
      expect(camel_case(line1)).to be(true)
    end
    # it 'checks the usage of CamelCase when naming a class and module' do
    #   expect(camel_case(line)).not_to be(true)
    # end
  end

  describe '#spaces_operators' do
    let(:line1) { 'capitalize, make your move a+b' }
    let(:line) { 'capitalize, make your move a + b' }

    it 'checks for spaces around operators, after commas, colons and semicolons' do
      expect(spaces_operators(line1)).to be(true)
    end
    it 'checks for spaces around operators, after commas, colons and semicolons' do
      expect(spaces_operators(line)).not_to eq(true)
    end
  end
end
