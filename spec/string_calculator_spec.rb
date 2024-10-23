# frozen_string_literal: true

require_relative '../string_calculator'

RSpec.describe StringCalculator do
  describe '#add' do
    let(:calculator) { StringCalculator.new }

    context 'when input string is empty' do
      it 'returns 0' do
        expect(calculator.add('')).to eq(0)
      end

      it 'returns 0' do
        expect(calculator.add).to eq(0)
      end
    end
  end
end
