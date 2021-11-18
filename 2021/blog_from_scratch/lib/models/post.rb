require 'erb'
require 'redcarpet'

class Post
  def initialize(data, template, parser: Redcarpet::Markdown.new(Redcarpet::Render::HTML), paths: )
    @paths = paths
    @data = data
    @template = template
    @parser = parser
  end

  def data
    File.read("#{@paths[:markdown]}/#{@data}")
  end

  def url
    "#{header.url}.html"
  end

  def save
    File.write(File.join(@paths[:html], url),publish)
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