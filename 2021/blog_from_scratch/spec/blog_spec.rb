require 'spec_helper'

require 'erb'
require 'redcarpet'

APP_ROOT = File.expand_path(File.dirname(__FILE__) )

class Blog

  def self.index
    # require 'pry'; binding.pry
  end

  DATA_PATH = File.expand_path('data')
  MARKDOWN_PATH = File.expand_path('md',DATA_PATH)
  HTML_PATH = File.expand_path('html',DATA_PATH)

  def initialize(data, template, parser: Redcarpet::Markdown.new(Redcarpet::Render::HTML))
    @data = data
    @template = template
    @parser = parser
  end

  def data
    File.read("#{MARKDOWN_PATH}/#{@data}")
  end

  def url
    "#{header.url}.html"
  end

  def save
    File.write(File.join(HTML_PATH, url),publish)
  end

  def body
    end_of_header = data.index("\n---\n\n") + 6
    d = data[end_of_header..-1]
    @parser.render(d)
  end

  def publish
    content
    header
    ERB.new(template).result(binding)
  end

  def header
    @header ||= Struct.new(
      :title,
    :description,
    :tags,
    :date,
    :publish,
    :url
    ).new(raw_header[:title], raw_header[:description], raw_header[:tags], raw_header[:date], raw_header[:publish], raw_header[:url])
  end

  def end_of_header
    end_of_header = data.index("\n---\n\n")
    top = data[0..end_of_header + 5]
  end

  def meta
    h = end_of_header.split("\n").reject { |d| d.include?("---") }
  end

  def raw_header
    array_of_hashes = meta.map do |ha|
      l = ha.split(":")
      { l[0].to_sym =>  l[1].lstrip }
    end

    single_hash = array_of_hashes.to_h { |h| [h.keys.first, h.values.first] }

    single_hash[:tags] = single_hash[:tags].split(",").map(&:lstrip)

    single_hash
  end

  def template
    File.read(@template)
  end

  def content
    @content ||= body
  end
end

RSpec.describe Blog do

  describe 'index' do
    xit 'list' do
      expect(described_class.index).to include("2021-11-12")
    end
  end

  describe 'post' do
    let(:template) {File.join(APP_ROOT, '..', 'lib', 'template.html.erb') }

    let(:data) { '2021-11-12.md' }

    subject { Blog.new(data, template) }

    describe 'save' do
      it 'save' do
        subject.save
        file = File.open(File.join('.', 'data', 'html', subject.url))
        expect(File.exist?(file)).to be
        File.delete(file)
      end
    end

    it 'convert md to html' do
      # require 'pry'; binding.pry
    end

    it 'data' do
      # require 'pry'; binding.pry
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