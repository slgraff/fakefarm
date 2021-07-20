# import raw file
f = ARGV[0]
file_name = ARGV[1]
file = File.read(f)

# make changes
file.gsub!('the LORD', '<span class="yhvh">YHVH</span>')
file.gsub!('The LORD', '<span class="yhvh">YHVH</span>')
file.gsub!('LORD', '<span class="yhvh">YHVH</span>')
file.gsub!('“', '"')
file.gsub!('”', '"')
file.gsub!('God', '<span class="elohim">Elohim</span>')
file.gsub!('[fn]', '')

verses = file.split(/\w+\s\d*:\d*$/)[1..-1]
reference = file.scan(/\w+\s\d*:\d*$/)

combo = reference.zip(verses)

def index(i)
  i += 1
  '%03d' % i
end

# # create json file
# json = combo.each_with_index.map do |w,i|
#   {
#     id: index(i),
#     ref: w[0],
#     text: w[1]
#   }
# end

def markup_word(text)
  file_word = ARGV[2]
  markup = %(<span class='term'>#{file_word}</span>)
  text.gsub!(file_word, markup)
end

total_verse_count = combo.count

file_word = ARGV[2]

meta_filled = %(
<h1 class="hero">#{file_word}</h1><h2 class='meta'>#{total_verse_count} verses contain the term: #{file_word}
</h2>)

meta_raw = %(<h2 class='meta'></h2>)

template = File.read('word_template.html')
draft1 = template.gsub(meta_raw, meta_filled)

# port in from directory /words/[word]/comments
comments = File.read('word_comments.html')
comments_raw = %(<section class='comments'></section>)
comments_filled = %(<section class='comments'>#{comments}</section>)

draft2 = draft1.gsub(comments_raw, comments_filled)

scripture_raw = %(<section class='scripture'></section>)

ul_start = %(<section class='scripture'>)
ul_end = %(</section>)

def special_verse(w)
  'highlight' if w[1].include?('YHVH') || w[1].include?('Elohim')
end

markup = combo.each_with_index.map do |w, i|
  %(<article class="verse #{special_verse(w)}">
      <div class='ref'>
        <div class="id">##{index(i)}</div><br>
        #{w[0]}
      </div>
      <p class='text'>#{markup_word(w[1])}</p></article>).gsub("\n", '')
end

scripture_filled = ul_start + markup.join('') + ul_end

final = draft2.gsub(scripture_raw, scripture_filled)

File.write("#{file_name}.html", final)

`open "#{file_name}.html"`
