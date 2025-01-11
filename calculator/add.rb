# Building a simple string calculator following TDD

def add(input)
    # Input is expected to be "//{ DELIMITER }\n{ NUMBER }[{ DELIMITER }{ NUMBER }]..."
    # "//;\n1;2;3" , "//;#\n1;#2;#3" are valid
    # "//#\n1#2,3" is invalid (1#2,3)

    raise TypeError, 'arg should be string' unless input.is_a? String
    
    return 0 if input.empty?

    input_validation = _validate(input)
    raise ArgumentError, 'arg should be delimiter separated numbers. eg. //;\n1;2;3' unless input_validation

    delimiter, numbers = input_validation.captures if input_validation
    raise ArgumentError, "all or a few numbers are not separated by delimiter => #{delimiter}" unless _validate_numbers?(numbers, delimiter)

    numbers.split(/#{Regexp.escape(delimiter)}/).map(&:to_i).sum
end

def _validate(input)
    input.match(%r{^//(.+)\n(.*)$})
end

def _validate_numbers?(numbers, delimiter)
    # This function validates if numbers is correctly separated by delimiter. input numbers could be "a,b:c"
    numbers.match?(/^(-?\d+)(#{Regexp.escape(delimiter)}-?\d+)*$/)
end
