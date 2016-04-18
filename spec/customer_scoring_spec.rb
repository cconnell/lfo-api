require 'spec_helper'

describe CustomerScoring do
  
  it 'requires more than two arguments' do
    expect{CustomerScoring::Customer.score("x", "y")}.to raise_error(ArgumentError)
  end

   it 'requires less than four arguments' do
    expect{CustomerScoring::Customer.score("x", "y", "z", "xx")}.to raise_error(ArgumentError)
  end

  it 'validates income argument' do
    expect(CustomerScoring::Customer.score("x35000", "90210", "50")).to eq ["Invalid income: x35000"]
  end

  it 'validates zipcode argument' do
    expect(CustomerScoring::Customer.score("35000", "9021", "50")).to eq ["Invalid zip code: 9021"]
  end

  it 'validates age argument' do
    expect(CustomerScoring::Customer.score("35000", "90210", "300")).to eq ["Invalid age: 300"]
  end

  it 'validates income, age, and zipcode arguments' do
    expect(CustomerScoring::Customer.score("x", "y", "z")).to eq ["Invalid income: x", "Invalid zip code: y", "Invalid age: z"]
  end

  it 'gets an http response' do
    expect(CustomerScoring::Customer.score("0", "00000", "1")).not_to be nil
  end
  it 'does not get an http response' do
    expect(CustomerScoring::Customer.score("0", "00000", "1")).not_to be false
  end

  it 'returns an error message if score info not found' do
    expect(CustomerScoring::Customer.score("0", "00000", "1")).to eq "404 error - Please verify your paramaters"
  end


end