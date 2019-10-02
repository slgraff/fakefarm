require 'harness/hacker_rank/counting_valleys'
RSpec.describe Harness::HackerRank::CountingValleys do
  describe 'one valley' do
    let(:path) { "UDDDUDUU" }
    let(:subject) { Harness::HackerRank::CountingValleys.new(path: path)}
    it 'one valley' do
      expect(subject.valleys).to eq(1)
    end
  end
  describe 'two valleys' do
    let(:path) { "DDUUDDUDUUUD" }
    let(:subject) { Harness::HackerRank::CountingValleys.new(path: path)}
    it 'valley' do
      expect(subject.valleys).to eq(2)
    end
  end

  describe 'count the changes' do
    let(:path) { "DDUDUDDUDDUDDUUUUDUDDDUUDDUUDDDUUDDUUUUUUDUDDDDUDDUUDUUDUDUUUDUUUUUDDUDDDDUDDUDDDDUUUUDUUDUUDUUDUDDD
" }
    let(:subject) { Harness::HackerRank::CountingValleys.new(path: path)}
    it '100 is 5' do
      expect(subject.valleys).to eq(5)
    end
  end
  end