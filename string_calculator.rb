# frozen_string_literal: true

# StringCalculator class has one method, add, takes input as string
#   and performs addition on numbers from the string
class StringCalculator
  # Add numbers from input string and perform the sum of the numbers
  # 
  #   @param input [String] - string with numbers
  #   @return: number [Integer] - sum of numbers from the input string
  #   @raise: exception - if input has any negative numbers
  def add(input = '')
    return 0 if input.to_s.strip.empty?

    numbers = remove_all_delimiters(input)
    select_all_negatives(numbers)

    numbers.reject { |n| n > 1000 }.sum
  end

  private

  # Remove all the delimiters
  #   @return: [Array] - of numbers
  def remove_all_delimiters(input)
    custom_delimiter = ','

    if input.start_with?('//')
      custom_delimiter = input[2] == '[' ? input[/\[(.*?)\]/, 1] : input[2]
      input = input.split("\n", 2)[1]
    end

    input.split(/[\n#{custom_delimiter}]/).map(&:to_i)
  end

  # Find and select negative numbers
  #   @raise: exception - if input has any negative numbers
  def select_all_negatives(numbers)
    negative_numbers = numbers.select(&:negative?)

    raise "Negative numbers not allowed: #{negative_numbers.join(',')}" if negative_numbers.any?
  end
end
