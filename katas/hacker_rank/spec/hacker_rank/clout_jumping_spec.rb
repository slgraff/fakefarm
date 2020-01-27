require 'harness/hacker_rank/cloud_jumping'

RSpec.describe Harness::HackerRank::CloudJumping do

  # fix the initializer then submit!!
  describe 'test 1' do
  let(:input) { [0,0,1,0,0,1,0] }
  let(:output) { 4 }
  let(:subject) { Harness::HackerRank::CloudJumping.new(input) }
  let(:run) { subject.run}
    it 'spec' do
      expect(run).to eq(output)
    end
  end

  describe 'test 2' do
    let(:input) { [0,0,0,0,1,0] }
    let(:output) { 3 }
    let(:subject) { Harness::HackerRank::CloudJumping.new(input) }
    let(:run) { subject.run}
    it 'spec' do
      expect(run).to eq(output)
    end
  end

  describe 'test 3' do
    let(:input) { [0,0,0,1,0,0 ] }
    let(:output) { 3 }
    let(:subject) { Harness::HackerRank::CloudJumping.new(input) }
    let(:run) { subject.run}
    it 'spec' do
      expect(run).to eq(output)
    end
  end

  describe 'getting dust off' do
    fit 'converts clouds to steps' do
      clouds = [0,0,1,0,0,1,0]
      expectation = [1,2,0,1,2,0,0]
      expect(subject.steps(clouds)).to eq(expectation)

      clouds2 = [0,0,0,0,1,0]
      expectation2 = [2,2,1,2,0,0]
      expect(subject.steps(clouds2)).to eq(expectation2)

      clouds3 = [0,0,0,1,0,0]
      expectation3 = [2,1,2,0,1,0]
      expect(subject.steps(clouds3)).to eq(expectation3)
    end

    it 'uses a flag to walk steps' do
      clouds = [0,0,1,0,0,1,0]
      expectation = [1,2,1,2]
      expect(subject.walk(clouds)).to eq(expectation)

      clouds2 = [0,0,0,0,1,0]
      expectation2 = [2,1,2]
      expect(subject.walk(clouds2)).to eq(expectation2)
    end
  end
  end
