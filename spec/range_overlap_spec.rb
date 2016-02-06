describe 'Range Overlap' do
  describe '#overlap' do
    it 'should be true for same ranges' do
      result = (1..3).overlaps?(1..3)

      expect(result).to be_truthy
    end
    
    it 'should be true for overlapping ranges' do
      result = (1..10).overlaps?(5..15)

      expect(result).to be_truthy
    end
    
    it 'should be false for non-overlapping ranges' do
      result = (1..5).overlaps?(6..15)

      expect(result).to be_falsey
    end
  end
end
