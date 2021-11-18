require 'spec_helper'
require_relative '../lib/models/post'

APP_ROOT = File.expand_path(File.dirname(__FILE__) )

RSpec.describe Post do
  describe 'post' do
    let(:template) {File.join(APP_ROOT, '..', 'lib', 'template.html.erb') }
    let(:data) { '2021-11-12.md' }

    let(:paths) {
      {
        markdown: File.expand_path('md', File.expand_path('fixtures', 'spec')),
        html: File.expand_path('html', File.expand_path('fixtures', 'spec'))
      }
    }

    subject { Post.new(data, template, paths: paths) }

    describe 'save' do
      it 'save' do
        subject.save
        file = File.open(File.join('.', 'spec', 'fixtures', 'html', subject.url))
        expect(File.exist?(file)).to be
        # File.delete(file)
      end
    end

    it 'data' do
      expect(subject.data).to be
    end

    it 'content' do
      expect(subject.content).to be
    end

    it 'body' do
      expect(subject.body).to start_with("<h1>Flip Face Mask Irony</h1>")
    end

    it 'template' do
      expect(subject.template).to be
    end

    it 'publish content' do
      expect(subject.publish).to include('Flip Face')
    end

    describe 'header' do
      let(:published) { subject.publish }

      it 'title' do
        expect(published).to include(subject.header.title)
      end

      it 'description' do
        expect(published).to include(subject.header.description)
      end
    end
  end
end