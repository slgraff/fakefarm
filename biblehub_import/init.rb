require 'nokogiri'
require 'open-uri'
require 'json'

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

scripture = [
# { book: 'genesis', chapter: [31, 25] }
{ book: 'isaiah', chapter: [31, 22, 26] }
]


scripture.each do |book|
  b = book[:book]
  book[:chapter].each_with_index do |c,i|
    i +=  1
    c.times do |n|
      n += 1
      doc = Nokogiri::HTML(open("https://biblehub.com/text/#{b}/#{i}-#{n}.htm"))
      verses = Nokogiri::HTML(open("https://biblehub.com/#{b}/#{i}-#{n}.htm"))
      v = verses.xpath('//*[@id="leftbox"]')

      table = doc.xpath("//table//tr//td//table")[5].children.children.first.children.first
      File.write("#{b}_#{i}_#{n}.html", table)
      @translations = []
      @versions = []
      @words = []
      table.children[1..-1].each do |t|
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

      File.write("#{b}_#{i}_#{n}.rb", scripture)
      File.write("#{b}_#{i}_#{n}.json", scripture.to_json)
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