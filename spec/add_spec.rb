# frozen_string_literal: true

require_relative '../calculator/add'

RSpec.describe "def add with" do
    context "valid argument" do
        [
            {input: '', expected: 0},
            {input: "//,\n1,2", expected: 3},
            {input: "//,\n1,2,3", expected: 6},
            {input: "//#,\n1#,2#,3", expected: 6},
        ].each do |example|
            it "#{example[:input]} returns #{example[:expected]}" do
                expect(add(example[:input])).to eq(example[:expected])
            end
        end
    end

    describe "invalid argument" do
      context "by value" do
        [
          { input: '1,hi', expected: { error: ArgumentError, message: 'arg should be delimiter separated numbers. eg. //;\n1;2;3' } },
          { input: "//,\n1,2#3", expected: { error: ArgumentError, message: 'all or a few numbers are not separated by delimiter => ,' } },
          { input: "//#,\n1#,2#,3#,-2", expected: { error: ArgumentError, message: 'negative numbers not allowed -2' } },
          { input: "//#,\n-5", expected: { error: ArgumentError, message: 'negative numbers not allowed -5' } },
        ].each do |example|
          it "#{example[:input]} raises #{example[:expected][:error]}" do
            expect { add(example[:input]) }.to raise_error(example[:expected][:error], example[:expected][:message])
          end
        end
      end

      context "by datatype" do
        [
          { input: 1234, expected: { error: TypeError, message: /arg should be string/ } },
          { input: 123.4, expected: { error: TypeError, message: /arg should be string/ } },
          { input: true, expected: { error: TypeError, message: /arg should be string/ } },
          { input: nil, expected: { error: TypeError, message: /arg should be string/ } },
          { input: [1,2], expected: { error: TypeError, message: /arg should be string/ } },
          { input: ['1,2'], expected: { error: TypeError, message: /arg should be string/ } },
        ].each do |example|
          it "#{example[:input]} raises #{example[:expected][:error]}" do
            expect { add(example[:input]) }.to raise_error(example[:expected][:error], example[:expected][:message])
          end
        end
      end
    end
end
