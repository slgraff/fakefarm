require 'spec_helper'
# require_relative '../lib/models/bin'

APP_ROOT = File.expand_path(File.dirname(__FILE__) )

class Bin
  def self.jot

  end
end

RSpec.describe Bin do
  it 'new jot' do
    described_class.jot
    require 'pry'; binding.pry
    dir = date.today
    expect(described_class.jot).to be
  end

  it 'new bible' do
  end

    it 'new topic' do
    end

end