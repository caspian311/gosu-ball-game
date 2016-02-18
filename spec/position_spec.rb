describe Position do
  let(:initial_x) { 5 }
  let(:initial_y) { 10 }

  let(:subject) do
    Class.new do
      include Position

      def initialize(x, y)
        @x = x
        @y = y
      end

      def width
        200
      end

      def height
        100
      end
    end.new(initial_x, initial_y)
  end

  describe '#top_left' do
    it 'should be the same as the original x, y' do
      expect(subject.top_left.x).to eq(initial_x)
      expect(subject.top_left.y).to eq(initial_y)
    end
  end

  describe '#top_right' do
    it 'should be offset by the width' do
      expect(subject.top_right.x).to eq(initial_x + 200)
      expect(subject.top_right.y).to eq(initial_y)
    end
  end

  describe '#bottom_left' do
    it 'should be offset by the height' do
      expect(subject.bottom_left.x).to eq(initial_x)
      expect(subject.bottom_left.y).to eq(initial_y + 100)
    end
  end

  describe '#bottom_right' do
    it 'should be offset by the height' do
      expect(subject.bottom_right.x).to eq(initial_x + 200)
      expect(subject.bottom_right.y).to eq(initial_y + 100)
    end
  end
end

