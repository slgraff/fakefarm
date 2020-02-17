require 'harness/ruby/fruit_cart'

RSpec.describe Harness::Ruby::FruitCart do
  FC = Harness::Ruby::FruitCart
  describe 'acceptance' do
    it 'adds items to cart' do
      fc = FC.new
      apple = 'apple'
      expect(fc.add(apple)).to eq('added')
    end

    let(:subject) { FC.new }
    it 'sends a message to the object that it has been received' do
      apple = 'apple'
      added = double()
      fc.add(apple)
      expect(added).to have_received(:added)
    end
  end
end
