require 'nokogiri'
require 'open-uri'
require 'json'
require_relative './bible_chapter_verse_count'
puts 'here we go...'
def strong(t)
  if t.children[0].children[0].children[0].attributes['title'].nil?
  else
    t.children[0].children[0].children[0].attributes['title'].value
  end
end

def strong_number(t)
  if t.children[0].children[0].children[0].text.length < 2
  else
    t.children[0].children[0].children[0].children[0].text
  end
end

def occurance(t)
  if t.children[1].children[2].children[0].attributes['title'].value.split("--")[1].nil?
    t.children[1].children[2].children[0].attributes['title'].value
  else
    t.children[1].children[2].children[0].attributes['title'].value.split("--")[1].split(' ')[1]
  end
end

def total(t)
  if t.children[1].children[2].children[0].attributes['title'].value.split("--")[1].nil?
    ''
  else
    t.children[1].children[2].children[0].attributes['title'].value.split("--")[1].split(' ')[-1].gsub('.','')
  end
end

# _dw fix Isaiah 3:10
# TODO
# - [ ] create a checksum for last successful verse so that when it errors out, I can know which one it is/was.
# - [ ]

# scripture = [
#   { book: 'genesis', chapter: [1] },
#   { book: 'isaiah', chapter: [1] }
# ]

LAST_SUCCESS = eval(File.read('last_success.rb'))

def last_chapter(chapters)
end

Toc.new.list do |book|
  # book
  b = book[0]
  puts "#{b}"
  # loop through each verse of each chapter
  last_chapter(book[1]).each_with_index do |c,i|
    puts "#{i}, #{c}"
    # make sure index is 1 based
    i +=  1
    # loop through each chapter
    c.to_i.times do |n|
      n += 1
      # make sure number is 1 based


      doc = Doc.new(b,i,n).doc

      puts "downloaded: #{b}/#{i}-#{n}"
      verses = Cat.new(b,i,n).verses


      puts "downloaded verses."
      require 'pry'; binding.pry
      v = verses.xpath('//*[@id="leftbox"]')

      table = doc.xpath("//table//tr//td//table")[5].children.children.first.children.first

      i_p = '%02d' % i.to_s
      n_p = '%02d' % n.to_s

      book_path = File.join(".", "downloads", "#{b}")
      chap_path = File.join(book_path, "#{i_p}")
      verse_path = File.join(chap_path, "#{n_p}" )

      Dir.mkdir(book_path) unless Dir.exists?(book_path)
      Dir.mkdir(chap_path) unless Dir.exists?(chap_path)
      Dir.mkdir(verse_path) unless Dir.exists?(verse_path)

      html = File.join(verse_path, "#{n_p}.html")
      File.write(html, table)

      @translations = []
      @versions = []
      @words = []
      table.children[1..-1].each do |t|
        next if t.children[2].children[0].nil?
        word = {
          source: {
            book: b,
            chapter: i,
            verse: n,
            reference: "#{b} #{i}:#{n}",
            text: t.children[2].children[0].text
          },
          hebrew: {
            word: t.children[1].children[0].text.reverse,
            translit: t.children[1].children[2].children[0].text,
            defined: t.children[1].children[2].children[0].attributes['title'].value.split("--")[0],
            stats: [
              occurance: occurance(t),
              total: total(t)
            ],
          },
          strongs: {
          strong_number: strong_number(t),
          strong_definition: strong(t)
          }
        }
        @words << word
      end
      puts "Words finished for puts #{b}/#{i}-#{n}"

      v[0].children[0].children[0..1][1..1].each do |vv|

        vv.children.each do |w|
          if w.name == "span" && w.elements[0].name == 'a'
            @versions << w.text
          end
          if w.name == "text"
            @versions << w.text
          end
        end
      end

      @versions.each_slice(2) do |v|
        @translations << {
          version: v[0],
          text: v[1]
        }
      end

      scripture = {
        words: @words,
        versions: @translations
      }
      puts "Writing #{b}/#{i}-#{n}"

      book_path_rb = File.join(".", "downloads", "rb", "#{b}")
      chap_path_rb = File.join(".", "downloads", "rb", "#{b}", "#{i}")

      #rb
      # scripture

      rb = File.join(verse_path, "#{n_p}.rb")
      File.write(rb, scripture)

      json = File.join(verse_path, "#{n_p}.json")
      File.write(json, scripture.to_json)


      last_success = {
        book: b,
        ch: i,
        ch_index: i - 1,
        v: n,
        vs_index: n - 1
      }

      File.write("last_success.rb", last_success)
    end
  end
end




# 3 save the html
# File.write("boom7.html", table)



# File.write("#{reference}.json", content.to_json)

# # 4
# class Atom
#   def initialize(content)
#     @content = content
#   end
# end