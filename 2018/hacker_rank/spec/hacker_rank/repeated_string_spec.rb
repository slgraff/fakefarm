require 'harness/hacker_rank/repeated_string'

RSpec.describe Harness::HackerRank::RepeatedString do
  describe 'first instance' do
    it 'all about a' do
      string = 'a'
      repeat = 100
      engine = Harness::HackerRank::RepeatedString.new(string: string, repeat: repeat)
      expect(engine.total).to eq(repeat)
    end
     it 'even with abc' do
      string = 'aba'
      repeat = 10
      engine = Harness::HackerRank::RepeatedString.new(string: string, repeat: repeat)
      expect(engine.total).to eq(7)
    end
  end
  end

#   a
#  1000000000000
#  1000000000000


# aba
# 10
# 7