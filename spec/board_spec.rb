# frozen_string_literal: true

require './board'
require 'byebug'
RSpec.describe Board do
  let(:board) { described_class.new }

  describe '#initialize' do
    it '15% of tihe cells must have a bombs' do
      percentage = (board.width * board.height * 0.15).floor
      bomb_counter = 0
      board.map.each do |row|
        row.each { |cell| bomb_counter += 1 if cell.bomb }
      end

      expect(bomb_counter).to be percentage
    end
  end
end
