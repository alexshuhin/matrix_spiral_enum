require 'rspec'
require 'custom_matrix'

describe CustomMatrix do
  describe 'performance' do
    let!(:matrix) { CustomMatrix.new(1000) }

    it 'should perform taking an 10 first even elements under 10ms' do
      expect{
        # matrix...
      }.to perform_under(10).ms
    end
  end

  context 'creating' do
    context 'when size specified' do
      it 'has 25 elements' do
        m = CustomMatrix.new(2)
        expect(m.count).to eql(25)
      end
    end

    context 'when size not specified' do
      it 'has 9 elements' do
        m = CustomMatrix.new
        expect(m.count).to eql(9)
      end
    end

    context 'limited values' do
      it 'it has max value < 10' do
        m = CustomMatrix.new(7)
        expect(m.max).to be < 10
      end

      it 'it has min value >= 0' do
        m = CustomMatrix.new(9)
        expect(m.min).to be >= 0
      end
    end
  end

  context 'enumerator laziness' do
    it 'should limit enumerator output' do
      m = CustomMatrix.new.lazy.each.first(4).to_a
      expect(m.size).to eql(4)
    end
  end

  context 'enumerator spiral' do
    it 'should enumerate from center' do
      custom_matrix = CustomMatrix.new
      first = custom_matrix.first
      expect(custom_matrix.matrix[1, 1]).to eql(first)
    end

    it 'should end on first matrix element' do
      custom_matrix = CustomMatrix.new
      last = custom_matrix.each.to_a.last
      expect(custom_matrix.matrix[0, 0]).to eql(last)
    end
  end
end
