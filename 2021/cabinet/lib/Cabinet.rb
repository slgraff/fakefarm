# frozen_string_literal: true

class Cabinet
  PATH = File.join('.', 'spec', 'fixtures', 'projects')
  README = 'readme'

  def initialize(path: PATH)
    @path = path
  end

  def tmp
    File.read("#{file}.md")
  end

  def run
    directory_title(directory_name).zip(readme)
  end

  def readme
    content.select { |p| p.include?(README) }
           .map { |d| File.read(d) }
  end

  def file(name = README)
    File.join(@path, name)
  end

  def metadata
    directories.map do |d|
      {
        path: d,
        dir: d.split('/')[-1],
        readme: readme?(d)
      }
    end
  end

  private

  def readme?(d)
    Dir.entries(d).map { |f| f.split('.') }.flatten.map(&:downcase).include?(README)
  end

  def directories
    content.select { |pl| Pathname.new(pl).directory? }
  end

  def content
    @content ||= Dir.glob("#{@path}/**/*").map(&:downcase)
  end

  def directory_name
    directories.map { |t| t.split('/')[-1] }
  end

  def directory_title(d)
    d.map { |t| "=== #{t} ===" }
  end
end
