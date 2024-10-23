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

    context 'when input string has only one number' do
      it 'returns the same number' do
        expect(calculator.add('1')).to eq(1)
      end
    end

    context 'when input string has more than one numbers' do
      it 'returns the sum of numbers' do
        expect(calculator.add('1,5')).to eq(6)
      end
    end

    context 'when input string has numbers separated by comma or newlines' do
      it 'returns the sum of numbers' do
        expect(calculator.add("1\n2,3")).to eq(6)
      end
    end

    context 'when input string has custom delimiter' do
      it 'returns the sum of the numbers' do
        expect(calculator.add("//;\n1;2")).to eq(3)
      end
    end
  end
end
