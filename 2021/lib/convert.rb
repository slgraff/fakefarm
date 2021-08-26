require 'yaml'
require 'yaml/store'
require '../lib/books'

class Convert
  attr_reader :title

  def initialize(config)
    file = config['import']
    title = config['title']
    dir = config['dir']
    @substitute = config['substitute']
    @search = config['search']
    @verses = config['verses']
    @file = File.read(file)
    @title = title
    universal_sub
    specific_sub
    verses = @file.split(/\S+\s\d+:\d+/)[1..-1]
    references = @file.scan(/\w+\s\d*:\d*$/)

    @combo = references.zip(verses)
    @file_name = File.join(__dir__, '..', config['dir'], @verses)
    File.delete(@file_name) if File.exist?(@file_name)
  end

  def universal_sub
    @file.gsub!('the LORD', "YHVH")
    @file.gsub!('The LORD', "YHVH")
    @file.gsub!('the Lord', "YHVH")
    @file.gsub!('The Lord', "YHVH")
    @file.gsub!('my Lord', "YHVH")
    @file.gsub!('My Lord', "YHVH")
    @file.gsub!('Oh Lord', "YHVH")
    @file.gsub!('O Lord', "YHVH")
    @file.gsub!('LORD', "YHVH")
    @file.gsub!('God', "Elohim")
    @file.gsub!('“', '"')
    @file.gsub!('”', '"')
    @file.gsub!('‘', "'")
    @file.gsub!('’', "'")
    @file.gsub!('[fn]', '')
  end

  def specific_sub
    return '' if @substitute.flatten.empty?
    @substitute.each do |s|
      highlight = "<span class='highligh-term'>#{s[1]}</span>"
      @file.gsub!(s[0], highlight)
    end
  end

  def call
    store
  end

  def book(v)
    Books::LIST[v.split(" ")[0]]
  end

  def chapter(v)
    v.split(" ")[1].split(":")[0]
  end

  def verse(v)
    v.split(" ")[1].split(":")[1]
  end

  def includes_YHVH(v)
    v[1].include?("YHVH")
  end

  def store
    store = YAML::Store.new @file_name
    store.transaction do
      store["verses"] = []
      store["title"] = title
      @combo.each_with_index do |v, i|
        i += 1
        store["verses"] << {
          "head" => {
            "ref_import" => v[0],
            "version" => "ESV",
            "source" => "blueletterbible.org",
            "search_term" => @search,
            "search_count" => @combo.count,
            "search_position" => i,
            "tag" => "zion",
            "includes_YHVH" => includes_YHVH(v)
          },
          "body" => {
            "book" => book(v[0]),
            "chapter" => chapter(v[0]).to_i,
            "verse" => verse(v[0]).to_i,
            "text" => v[1].gsub("\n\n","")
          }
        }
      end
    end
  end
end
