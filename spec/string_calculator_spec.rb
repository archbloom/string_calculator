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

    context 'when input string has negative numbers' do
      it 'raises an exception with the negative numbers in the message' do
        expect { calculator.add('1,-2,3, -4') }.to raise_error('Negative numbers not allowed: -2,-4')
      end
    end

    context 'when input string has number bigger than 1000' do
      it 'returns the sum of other numbers' do
        expect(calculator.add('2,10001,3')).to eq(5)
      end
    end

    context 'when input string has custom delimiter bigger than one char' do
      it 'returns the sum of numbers' do
        expect(calculator.add("//[***]\n1***2***3")).to eq(6)
      end
    end

    context 'when input string has only one * then mutliply numbers' do
      it 'returns multiplication of numbers' do
        expect(calculator.add("//*\n3*2*2")).to eq(12)
      end
    end
  end
end
