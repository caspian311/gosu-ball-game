describe CollisionDetection do
  let(:described_class) do
    Class.new do
      include Position
      include CollisionDetection
      
      def initialize(x, y, width, height)
        @x = x
        @y = y
        @width = width
        @height = height
      end

      def width
        @width
      end

      def height
        @height
      end
    end
  end
  let(:subject) do
    described_class.new subject_x, subject_y, subject_width, subject_height
  end
  let(:other) do
    described_class.new other_x, other_y, other_width, other_height
  end

  shared_context 'should hit' do
    it 'should hit?' do
      expect(subject.hit? other).to be_truthy
    end
  end

  shared_context 'should miss' do
    it 'should not hit?' do
      expect(subject.hit? other).to be_falsey
    end
  end

  describe 'same position' do
    let(:subject_x) { 20 }
    let(:subject_y) { 10}
    let(:other_x) { 20 }
    let(:other_y) { 10}

    let(:subject_width) { 10 }
    let(:subject_height) { 10}
    let(:other_width) { 10 }
    let(:other_height) { 10}

    it_behaves_like 'should hit'
  end

  describe 'other is below and to the right of subject' do
    let(:subject_x) { 10 }
    let(:subject_y) { 10}
    let(:other_x) { 30 }
    let(:other_y) { 30}

    let(:subject_width) { 10 }
    let(:subject_height) { 10}
    let(:other_width) { 10 }
    let(:other_height) { 10}

    it_behaves_like 'should miss'
  end

  describe 'subject is below and to the right of other' do
    let(:subject_x) { 30 }
    let(:subject_y) { 30}
    let(:other_x) { 10 }
    let(:other_y) { 10}

    let(:subject_width) { 10 }
    let(:subject_height) { 10}
    let(:other_width) { 10 }
    let(:other_height) { 10}

    it_behaves_like 'should miss'
  end

  describe 'other overlaps bottom right corner of subject' do
    let(:subject_x) { 10 }
    let(:subject_y) { 10}
    let(:other_x) { 15 }
    let(:other_y) { 15}

    let(:subject_width) { 10 }
    let(:subject_height) { 10}
    let(:other_width) { 10 }
    let(:other_height) { 10}

    it_behaves_like 'should hit'
  end

  describe 'other overlaps bottom left corner of subject' do
    let(:subject_x) { 10 }
    let(:subject_y) { 10 }
    let(:other_x) { 5 }
    let(:other_y) { 15 }

    let(:subject_width) { 10 }
    let(:subject_height) { 10 }
    let(:other_width) { 10 }
    let(:other_height) { 10 }

    it_behaves_like 'should hit'
  end

  describe 'other encompasses the subject' do
    let(:subject_x) { 10 }
    let(:subject_y) { 10 }
    let(:other_x) { 5 }
    let(:other_y) { 5 }

    let(:subject_width) { 5 }
    let(:subject_height) { 5 }
    let(:other_width) { 20 }
    let(:other_height) { 20 }

    it_behaves_like 'should hit'
  end

  describe 'subject encompasses the other' do
    let(:subject_x) { 5 }
    let(:subject_y) { 5 }
    let(:other_x) { 10 }
    let(:other_y) { 10 }

    let(:subject_width) { 20 }
    let(:subject_height) { 20 }
    let(:other_width) { 5 }
    let(:other_height) { 5 }

    it_behaves_like 'should hit'
  end

  describe 'subject completely above other' do
    let(:subject_x) { 5 }
    let(:subject_y) { 5 }
    let(:other_x) { 20 }
    let(:other_y) { 20 }

    let(:subject_width) { 5 }
    let(:subject_height) { 5 }
    let(:other_width) { 5 }
    let(:other_height) { 5 }

    it_behaves_like 'should miss'
  end

  describe 'other completely above subject' do
    let(:subject_x) { 20 }
    let(:subject_y) { 20 }
    let(:other_x) { 5 }
    let(:other_y) { 5 }

    let(:subject_width) { 5 }
    let(:subject_height) { 5 }
    let(:other_width) { 5 }
    let(:other_height) { 5 }

    it_behaves_like 'should miss'
  end
end
