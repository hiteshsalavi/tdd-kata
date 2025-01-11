# Building a simple string calculator following TDD

def add(numbers)
    return 0 if numbers.empty?

    numbers.split(',').map(&:to_i).sum
end
