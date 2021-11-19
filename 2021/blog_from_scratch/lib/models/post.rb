require 'erb'
require 'redcarpet'
require 'fileutils'

class String
  def present?
    !self.empty?
  end
end


class Post

  APP_ROOT = File.join(File.expand_path(__FILE__), '..', '..','..')


  def initialize(data, template, parser: Redcarpet::Markdown.new(Redcarpet::Render::HTML), paths: )
    @paths = paths
    @data = data
    @template = template
    @parser = parser
    @date = date
  end

  def data
    File.read("#{@paths[:markdown]}/#{@data}")
  end

  def url
    "#{header.url}"
  end

  def save
    make_directories
    File.write(File.join(@paths[:html], url, 'index.html'),publish)
  end

  def make_directories
    path = @paths[:html] +  "/#{url}"
    FileUtils.mkdir_p(path)
  end

  def body
    d = if header?
        end_of_header = data.index("\n---\n\n") + 6
        data[end_of_header..-1]
      else
        end_of_header = data.index("\n\n") + 2
        data[end_of_header..-1]
      end
    @parser.render(d)
  end

  def publish
    content
    header
    hero
    ERB.new(template).result(binding)
  end

  def hero
    unless header.hero.nil?
      @hero ||= File.join(APP_ROOT, 'public', 'uploads', header.hero)
    end
  end

  def header
    @header ||= Struct.new(
      :title,
    :description,
    :tags,
    :date,
    :publish,
    :url,
    :reference,
    :hero
    ).new(raw_header[:title], raw_header[:description], raw_header[:tags], raw_header[:date], raw_header[:publish], raw_header[:slug], raw_header[:reference], raw_header[:hero])
  end

  def date
    return unless raw_header[:date]
    y,m,d = raw_header[:date].split('-')
    Struct.new(:year, :month, :day).new(y,m,d)
  end

  def end_of_header
    end_of_header = data.index("\n---\n\n")
    top = data[0..end_of_header + 5]
  end

  def meta
    h = end_of_header.split("\n").reject { |d| d.include?("---") }
  end

  def header?
    data[0..2] == '---'
  end

  def raw_header
    if header?
    begin
      array_of_hashes = meta.map do |ha|
        key = ha.split(":").first
        value = ha[(key.length + 1)..-1]
        { key.to_sym =>  value.lstrip }
      rescue
        raise "Missing header key for: '#{ha}' / File: #{@data}"
      end
    end

    single_hash = array_of_hashes.to_h { |h| [h.keys.first, h.values.first] }

    single_hash[:tags] = single_hash[:tags].split(",").map(&:lstrip)

    single_hash

    else
      {
        title: @data.split(".md").first,
        description: @data.split(".md").first,
        tags: 'jot',
        date: @data.split(".md").first,
        path: @data.split(".md").first.split("-")[0..1].join("/"),
        slug: @data.split(".md").first.split("-")[-1]
      }
    end
  end

  def template
    File.read(@template)
  end

  def content
    @content ||= body
  end
end