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

    operator, initial_val, numbers = parse_numbers_and_operator(input)
    select_all_negatives(numbers)

    numbers.reduce(initial_val, operator.to_sym)
  end

  private

  # Parse numbers, initial value for the operation and operator from input
  #   @input: input [String] - string with numbers
  #   @return: [operator, initial value, Array of numbers]
  def parse_numbers_and_operator(input)
    custom_delimiter = ','

    if input.start_with?('//')
      custom_delimiter = input[2] == '[' ? input[/\[(.*?)\]/, 1] : input[2]
      input = input.split("\n", 2)[1]
    end

    operator, initial_val = parse_operator_and_initial_value(custom_delimiter)
    numbers = input.split(/[\n#{custom_delimiter}]/).map(&:to_i).reject{ |n| n > 1000 }
    [operator, initial_val, numbers]
  end

  # Parse the operator and determine the intial value
  #   @input: delimiter [String]
  #   @return: [operator, initial_value]
  def parse_operator_and_initial_value(delimiter)
    delimiter == '*' ? ['*', 1] : ['+', 0]
  end

  # Find and select negative numbers
  #   @raise: exception - if input has any negative numbers
  def select_all_negatives(numbers)
    negative_numbers = numbers.select(&:negative?)

    raise "Negative numbers not allowed: #{negative_numbers.join(',')}" if negative_numbers.any?
  end
end
