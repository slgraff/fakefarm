require 'spec_helper'
require_relative '../lib/models/post'


RSpec.describe Post do
  APP_ROOT = File.expand_path(File.dirname(__FILE__) )
  subject { Post.new(data, template, paths: paths) }

  after do
    # FileUtils.rm_rf('spec/fixtures/html/')
  end

  describe 'post' do
    describe 'bible posts' do

      let(:template) {File.join(APP_ROOT, '..', 'lib', 'templates', 'bible.html.erb') }
      let(:data) { 'psalms-119-71.md' }

      let(:paths) {
        {
          markdown: File.join('spec', 'fixtures', 'md', 'bible'),
          html: File.join('spec', 'fixtures', 'html', 'bible', 'psalms', '119', '71')
        }
      }

      describe 'save' do
        it 'save' do
          subject.save
          file = File.open(File.join('spec', 'fixtures', 'html', 'bible', 'psalms', '119', '71', subject.url, 'index.html'))
          expect(File.exist?(file)).to be

        end
      end

      it 'hero' do
        expect(subject.hero).not_to be_empty
      end

      it 'data' do
        expect(subject.data).to be
      end

      it 'content' do
        expect(subject.content).to be
      end

      it 'body' do
        expect(subject.body).to start_with("<h1>It is good</h1>")
      end

      it 'template' do
        expect(subject.template).to be
      end

      it 'publish content' do
        expect(subject.publish).to include("I didn&#39;t know YHVH&#39;s statutes, and I certainly didn&#39;t delight in them.")

        expect(subject.publish).to include("It is good for me that I was afflicted, that I might learn YHVH's statutes.")

        expect(subject.publish).to include("Psalm 119:71")
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

    describe 'jot posts' do

      let(:template) {File.join(APP_ROOT, '..', 'lib', 'templates', 'jot.html.erb') }
      let(:data) { '2021-11-12.md' }

      let(:paths) {
        {
          markdown: File.join('spec', 'fixtures', 'md', 'jots'),
          html: File.join('spec', 'fixtures', 'html', 'jots', '2021', '11')
        }
      }

      describe 'save' do
        it 'save' do
          subject.save
          file = File.open(File.join('spec', 'fixtures', 'html', 'jots', '2021', '11', subject.url, 'index.html'))
          expect(File.exist?(file)).to be

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

    describe 'jot legacy posts' do

      let(:template) {File.join(APP_ROOT, '..', 'lib', 'templates', 'jot.html.erb') }
      let(:data) { '2021-11-19.md' }

      let(:paths) {        {
          markdown: File.join('spec', 'fixtures', 'md', 'jots'),
          html: File.join('spec', 'fixtures', 'html', 'jots', '2021', '11')
        }
      }

      describe 'save' do
        it 'save' do
          subject.save
          file = File.open(File.join('spec', 'fixtures', 'html', 'jots', '2021', '11', subject.url, 'index.html'))
          expect(File.exist?(file)).to be
        end
      end

      it 'data' do
        expect(subject.data).to be
      end

      it 'content' do
        expect(subject.content).to be
      end

      it 'body' do
        expect(subject.body).to start_with("<h1>Learning to code is like learning to speak</h1>")
      end

      it 'template' do
        expect(subject.template).to be
      end

      it 'publish content' do
        expect(subject.publish).to include('The power of privacy')
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

    describe 'jot month posts' do

      let(:template) {File.join(APP_ROOT, '..', 'lib', 'templates', 'jots', 'month.html.erb') }
      let(:data) { '2021-11.md' }

      let(:paths) {        {
          markdown: File.join('spec', 'fixtures', 'md', 'jots'),
          html: File.join('spec', 'fixtures', 'html', 'jots', '2021')
        }
      }

      describe 'save' do
        it 'save' do
          subject.save
          file = File.open(File.join('spec', 'fixtures', 'html', 'jots', '2021', subject.url, 'index.html'))
          expect(File.exist?(file)).to be
        end
      end

      it 'data' do
        expect(subject.data).to be
      end

      it 'content' do
        expect(subject.content).to be
      end

      it 'body' do
        expect(subject.body).to start_with("<h1>Month overview</h1>")
      end

      it 'publish content' do
        expect(subject.publish).to include('Month overview')
      end
    end
  end
end