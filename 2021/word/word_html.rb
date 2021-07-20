require_relative 'word_search'
ul_start = %(<ul>)
ul_end = %(</ul>)
markup = WORD.map do |w|
  %(
  <li>
    <article>
      <h2 class='ref'>#{w[:reference]}</h2>
      <p class='verse'>#{w[:text]}</p>
    </article>
  </li>
  ).gsub("\n", '')
end

output = ul_start + markup.join('') + ul_end
File.write('in_the_beginning.html', output)
