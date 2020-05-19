require_relative '../lib/file.rb'

RSpec.describe Files do
  describe '#one_line_data_chars' do
    let(:line) { 'je mange' }
    it 'should return an array of characters' do
      expect(Files.one_line_data_chars(line)).to eql(['j', 'e', ' ', 'm', 'a', 'n', 'g', 'e'])
    end
    it 'should return an array of characters including whitespaces' do
      expect(Files.one_line_data_chars(line)).not_to eql(%w[j e m a n g e])
    end
  end

  describe '#one_line_data_words' do
    let(:line) { 'je mange' }
    it 'should return an array of words' do
      expect(Files.one_line_data_words(line)).to eql(%w[je mange])
    end
    it 'should return an array of words excluding whitespaces' do
      expect(Files.one_line_data_words(line)).not_to eql(['je', ' ', 'mange'])
    end
  end

  describe '#line_length' do
    let(:line) { 'je mange' }
    it 'should return the length of the line' do
      expect(Files.line_length(line)).to eql(8)
    end
    it 'should return the length of the line including whitespaces' do
      expect(Files.line_length(line)).not_to eql(7)
    end
  end
end
