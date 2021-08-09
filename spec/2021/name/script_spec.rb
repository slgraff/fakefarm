require 'spec_helper'
require './2021/name/lib/script.rb'
require_relative './fixtures/my_name_raw.rb'

RSpec.describe Script do
  let(:raw) { File.join('.', 'spec', '2021', 'name', 'fixtures','my_name_raw.rb') }
  let(:output) { File.join('.', 'spec', '2021', 'name', 'fixtures', 'index.html')}
  let(:template) { File.join('.', 'spec', '2021', 'name', 'fixtures', 'basic_template.erb') }

  subject { described_class.new(raw: raw, output: output, template: template) }

  it 'outputs raw to html' do
    file = File.join('.', 'spec', '2021', 'name', 'fixtures','index.html')

    if File.exists?(file)
      File.delete(file)
    end

    subject.html

    expect(File.exist?(file)).to be true
  end

  describe 'steps' do
    describe 'loading raw file' do
      it 'takes a raw file' do
        expect(subject.raw).to eq(RAW)
      end
    end

    it 'takes an erb template' do
      expect(subject.template).to include("Elohim also said to Moses,")
    end
  end
end