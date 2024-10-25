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

## Code structure

The `StringCalculator` class consists of:
1. public `add` method:  
Takes input string and performs summof the numbers in the input.
2. private `remove_all_delimiters` method:  
Takes input string and removes all the delimiters and return numbers.
3. private `select_all_negatives` method:  
Takes numbers and collects negative numbers, and raises exception if there are any negative numbers.

## Usage
**Example Usage**

To use the String Calculator, create an instance of the `StringCalculator` class and call the `add` method with a string having numbers to be added:
```ruby
calculator = StringCalculator.new
sum = calculator.add('1,2,3')
puts sum # 6
```
## Different Input Formats

**With no input**

If the `add` method does not get input it returns 0.
```ruby
calculator = StringCalculator.new
sum = calculator.add('')
puts sum # 0
```

**With default delimiter**

The `add` method supports default delimiter comma `,`. It will perform sum of all the numbers separated by comma.
```ruby
calculator = StringCalculator.new
sum = calculator.add('1,2,3')
puts sum # 6
```

**With `\n` as delimiter**

The `add` method accpets `\n` in input and ignores it to perform sum on the numbers.
```ruby
calculator = StringCalculator.new
sum = calculator.add("1\n2,3")
puts sum # 6
```

**With custom delimiter**

The `add` method also supports the custom delimiter. Custom delimiter is declared in the beginning of the input string. eg: `//[delimiter]\n[numbers]`
```ruby
calculator = StringCalculator.new
sum = calculator.add("//;\n1;2")
puts sum # 3
```

**With multi char custom delimiter**

The `add` method supports the custom delimiter with more than one char. Custom delimiter is declared in the beginning of the input string. eg: `//[delimiter]\n[numbers]`
```ruby
calculator = StringCalculator.new
sum = calculator.add("//[***]\n1***2***")
puts sum # 3
```

**Ignores the numbers bigger than 1000**

The `add` method ignores the numbers which are bigger than 1000.
```ruby
calculator = StringCalculator.new
sum = calculator.add('2,1001,3')
puts sum # 5
```

**Raises exception for negative numbers**

The `add` method does not support negative numbers. It raises exception.

```ruby
calculator = StringCalculator.new
sum = calculator.add('1,-2,3, -4')
# Exception: Negative numbers not allowed: -2,-4
```
