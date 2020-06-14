require 'spec_helper'
require_relative '../lib/toc'

RSpec.describe Toc do
  subject { Toc.new }

  it 'book' do
    expect(subject.books(1).name).to eq('genesis')
  end

  it 'chapters' do
    expect(subject.books(1).chapters).to eq(50)
  end

  it 'chapters' do
    expect(subject.books).to eq(39)
  end

  it 'verses' do
    expect(subject.books(1).verses(1)).to eq(31)
  end

  it 'list' do
    expect(subject.list[0]).to be_instance_of(Book)
    expect(subject.list[0].name).to eq("genesis")
  end

  it 'placeholder' do
    last = {:book=>"genesis", :ch=>1, :v=>4}
    expect(subject.placeholder).to eq(last)
  end
end

RSpec.describe Book do
  subject { described_class.new('genesis', [22])}

  it 'name' do
    expect(subject.name).to eq('genesis')
  end

  it 'chapter' do
    expect(subject.chapters).to eq(1)
  end

  it 'verses' do
    expect(subject.verses(1)).to eq(22)
  end
end