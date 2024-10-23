# String Calculator Kata
This is the solution for the kata mentioned here: [TDD Kata](https://osherove.com/tdd-kata-1/)

## Approach
- Create a class named `StringCalculator`.
- Add a method `add` which will accept a string input and returns the sum of the numbers from the input string.

## Features
- Supports multiple custom delimiters of any length.
- Allows custom delimiters defined in the format `//[delimiter]\n`.
- Ignores numbers greater than `1000`.
- Raises an error for _negative_ numbers.
- Returns the sum of valid numbers.

## Usage
**Example Usage**

To use the String Calculator, create an instance of the `StringCalculator` class and call the `add` method with a string having numbers to be added:
```ruby
calculator = StringCalculator.new
sum = calculator.add('1,2,3')
puts sum # 6
```

