require_relative '../cell.rb'

RSpec.describe Cell do
  let(:cell) { described_class.new(0,0) }

  describe '#open' do
    it 'change from open from close to false' do
      cell.open

      expect(cell.opened).to be true
    end
  end
end
