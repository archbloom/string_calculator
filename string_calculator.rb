# frozen_string_literal: true

# StringCalculator class has one method, add, takes input as string
#   and performs addition on numbers from the string
class StringCalculator
  # Add numbers from input string and does the sum of the numbers
  # 
  # params: input - string with numbers
  # returns: number - sum of numbers from the input string
  def add(input = '')
    return 0 if input.empty? || input.nil?

    custom_delimiter = ','

    if input.start_with?('//')
      custom_delimiter = input[2]
      input = input[3..]
    end

    numbers = input.split(/[\n#{custom_delimiter}]/).map(&:to_i)
    negative_numbers = numbers.select(&:negative?)

    raise "Negative numbers not allowed: #{negative_numbers.join(',')}" if negative_numbers.any?

    numbers.sum
  end
end
