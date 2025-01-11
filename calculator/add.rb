# Building a simple string calculator following TDD

def add(numbers)
    raise TypeError, 'arg should be string' unless numbers.is_a? String
    return 0 if numbers.empty?
    raise ArgumentError, "arg should be ', \n' separated numbers" unless valid_format?(numbers)

    numbers = numbers.gsub(/[\n]/, ',')
    numbers.split(',').map(&:to_i).sum
end

private

def valid_format?(numbers)
    numbers.match?(/^(-?\d+)([,\n]-?\d+)*$/)
end
