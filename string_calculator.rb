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
  end
end
