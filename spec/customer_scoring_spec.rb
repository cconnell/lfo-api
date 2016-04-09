require 'spec_helper'

describe CustomerScoring do
  it 'gets an http response' do
    expect(CustomerScoring::Customer.score("x", "y", "z")).not_to be nil
  end
  it 'does not get an http response' do
    expect(CustomerScoring::Customer.score("x", "y", "z")).not_to be false
  end

  it 'returns an error message if score info not found' do
    expect(CustomerScoring::Customer.score("x", "y", "z")).to eq "404 error - Please verify your paramaters"
  end

  it 'requires more than two arguments' do
    expect{CustomerScoring::Customer.score("x", "y")}.to raise_error(ArgumentError)
  end

   it 'requires less than four arguments' do
    expect{CustomerScoring::Customer.score("x", "y", "z", "xx")}.to raise_error(ArgumentError)
  end

end