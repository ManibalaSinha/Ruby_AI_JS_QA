# spec/sample_spec.rb
require_relative 'spec_helper'

RSpec.describe "Sample Test" do
  it "adds numbers correctly" do
    expect(2 + 3).to eq(5)
  end

  it "checks a string match" do
    expect("Ruby Web QA").to include("Ruby")
  end
end
