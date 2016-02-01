require 'spec_helper'
require 'repeated_substring'

RSpec.describe 'repeated_substring' do
  it 'finds the repeated substring in a string containing one repeated substring' do
    rs = RepeatedSubstring.new
    expect(rs.find_repeated_substring('bonona')).to eq('on')
  end

  it 'finds the first repeated substring in a string containing two repeated substrings of equal length' do
    rs = RepeatedSubstring.new
    expect(rs.find_repeated_substring('ban-na+an>na')).to eq('an')
  end

  it 'finds the longest repeated substring in a string containing multiple repeated substrings' do
    rs = RepeatedSubstring.new
    expect(rs.find_repeated_substring('banaanonaa')).to eq('naa')
  end

  it 'ignores repeated substrings that are overlapping in a string' do
    rs = RepeatedSubstring.new
    expect(rs.find_repeated_substring('bababa')).to eq('ba')
  end

  it 'finds the longest repeated substring including spaces in a string' do
    rs = RepeatedSubstring.new
    expect(rs.find_repeated_substring('frar gro fr gcar ')).to eq('ar ')
  end

  it 'ignores repeated substrings that are all spaces' do
    rs = RepeatedSubstring.new
    expect(rs.find_repeated_substring('ba   ab   cab')).to eq('ab')
  end

  it 'outputs \'NONE\' if no repeated substrings exist in a string' do
    rs = RepeatedSubstring.new
    expect(rs.find_repeated_substring('a abcde fg zyx')).to eq('NONE')
  end

  xit 'find the most repeated substring for every line of a file' do
    expect(RepeatedSubstring.new.find_repeated_substring_file('data/sample.txt')).to eq(['an', 'NONE', 'NONE', 'oo'])
  end
end
