class Toc
  FILE = './bible_chapter_verse_count.rb'
  PLACEHOLDER = './last_success.rb'

  attr_reader :file
  def initialize(file=FILE, placeholder=PLACEHOLDER)
    f = File.read(file)
    @file = eval(f)
    create_books
    @placeholder = placeholder
  end

  def list
    @file.map { |b| Book.new(b[0], b[1]) }
  end

  def placeholder
    last = File.read(@placeholder)
    eval(last)
  end

  def books(n=0)
    if n == 0
      39
    else
      @books[n]
    end
  end

  def create_books
    @books = [0]
    @file.each do |f|
      @books << Book.new(f[0], f[1])
    end
  end
end

class Book
  attr_reader :name, :chapters

  def initialize(name, chapters)
    @name = name
    @chapters = chapters
  end

  def chapters
    @chapters.count
  end

  def verses(n)
    vs = n - 1
    @chapters[vs].to_i
  end
end

class Doc
  attr_reader :book, :chapter, :verse

  def initialize(book, chapter, verse)
    @book = book
    @chapter = chapter
    @verse = verse
  end

  def doc
    Nokogiri::HTML(open("https://biblehub.com/text/#{book}/#{chapter}-#{verse}.htm"))
  end
end

class Cat
  attr_reader :book, :chapter, :verse

  def initialize(book, chapter, verse)
    @book = book
    @chapter = chapter
    @verse = verse
  end

  def verses
    Nokogiri::HTML(open("https://biblehub.com/#{book}/#{chapter}-#{verse}.htm"))
  end
end
