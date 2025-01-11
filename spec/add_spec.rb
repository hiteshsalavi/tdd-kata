# frozen_string_literal: true

require_relative '../calculator/add'

RSpec.describe "def add with" do
    context "valid arguments" do
        [
            {input: '', expected: 0},
            {input: '1,2', expected: 3},
            {input: '1,2,3', expected: 6},
            {input: '1,2,3,-2', expected: 4},
        ].each do |example|
            it "returns #{example[:expected]} for #{example[:input]}" do
                expect(add(example[:input])).to eq(example[:expected])
            end
        end
    end

    context "invalid arguments" do
        [
          { input: 1234, expected: { error: TypeError, message: /arg should be string/ } },
          { input: 123.4, expected: { error: TypeError, message: /arg should be string/ } },
          { input: true, expected: { error: TypeError, message: /arg should be string/ } },
          { input: nil, expected: { error: TypeError, message: /arg should be string/ } },
          { input: [1,2], expected: { error: TypeError, message: /arg should be string/ } },
          { input: ['1,2'], expected: { error: TypeError, message: /arg should be string/ } },
          { input: '1,hi', expected: { error: ArgumentError, message: /arg should be "," separated numbers/ } },
        ].each do |example|
          it "raises #{example[:expected][:error]} for input #{example[:input]}" do
            expect { add(example[:input]) }.to raise_error(example[:expected][:error], example[:expected][:message])
          end
        end
    end
end
