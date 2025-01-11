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
end
