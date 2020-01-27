require 'harness/hacker_rank/sock_merchant'

RSpec.describe Harness::HackerRank::
SockMerchant do
  let (:quantity) { 9 }
  let (:colors) { [ 10,20,20,10,10,30,50,10,20 ] }
  let (:subject) { Harness::HackerRank::SockMerchant.new(socks: quantity, pile: colors) }


  describe 'works on my machine' do
    it 'match' do
      expect(subject.match).to eq(3)
    end
  end
end