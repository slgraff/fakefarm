# go on a search
# accumulate tabs
# get interrupted

# want to save tabs for later
# open tab/snap
# open termimnal
# cd to links/data/import
# create file name 2021-10-10-linux
# paste contents into file
# https://github.com/prasmussen/chrome-cli
# chrome-cli list tabs
# chrome-cli info -t [tab number]

# run processes
# # paste in


require 'spec_helper'
# require 'link.rb'





require 'open3'
require 'date'
require 'yaml'
require 'metainspector'

class Scrape
  def initialize(site)
    @site = site
    require 'pry'; binding.pry
  end
end


class Link
  attr_reader :tabs, :tab

  TERMS = ["bash", "best practice", "best practices", "bible", "client", "commands", "css", "data", "database", "google", "graphics", "guide", "heroku", "how to", "html", "http", "javascript", "js", "linux", "manage", "minitest", "unit", "keyshape", "affinity", "tutorial", "step", "nginx", "postgres", "production", "puma", "rails", "rspec", "ruby", "server", "shell", "sinatra", "sql", "sublime", "tdd", "terminal", "torah", "til", "tutorial", "unix", "utf", "verse", "youtube"]

  def initialize
    @tab_class = Struct.new(:title, :url)
    @tab = []
  end

  def import
    return @tabs unless @tabs.nil?
    tabs, stderr, status = Open3.capture3("chrome-cli list tabs")

    if status.success?
      @tabs ||= tabs
    else
      raise status.to_s
    end
  end

  def tab_index
    return @ti unless @ti.nil?
    @ti = ids.map do |id|
      @stdout, @stderr, @status = Open3.capture3("chrome-cli info -t #{id}")
      next if @stdout.empty?
      tt = @tab_class.new(tab_title(@stdout), tab_url(@stdout))
      next if tt.title.nil?
      Scrape.new(tt)
      @tab << tt
    end
    @tab
  end

  def ids
    @ids ||= tabs.split("\n").map { |t| t.split(" ") }.map {|t| t[0]}.map { |t| t.split(":")}.map { |t| t[1].to_i }.sort
  end

  def tab_title(t)
    t.split("\n")[1].split("Title: ")[1]
  end

  def tab_url(t)
    t.split("\n")[2].split("Url: ")[1]
  end

  def format
    tab_index
    return @f unless @f.nil?
    @f ||= @tab.map do |t|
      {
        title: t.title,
        url: t.url,
        created:  Date.today.to_s,
        tags: tags(t),
        date_read: nil,
        save: nil,
        # google_search_term: [] # is it possible / profitable to pair what I searched for and what I found?
        # I want to learn, and i want to document what I learn for myself to master, and my interview to have specific examples of intricate activities I've completed. Such as:
        # Scalling, performance improvements, refactoring, design patterns, unique intricacies
        # I would need to have a deliverable for these. Middleman links version two.
        # Curl the blog link I sent and see what comes back for nokogiri
      }
    end
  end

  def tags(t)
    begin
    tags = t.title.split(' ')
      .map { |w| w.split('/') }.flatten
      .map { |w| w.split('-') }.flatten
      .map(&:downcase)
    tags & TERMS
    rescue
      # require 'pry'; binding.pry
    end
  end

  def save
    File.write("#{Date.today.to_s}-links.rb", format)
    File.write("#{Date.today.to_s}-links.yml", format.to_yaml)
  end
end

describe Link do

  before(:all) do
    %x(open "http://www.fakefarm.com")
    @link = Link.new
    @link.import
  end

  it 'import' do
    expect(@link.import[0].include?("fake farm")).to eq true
  end

  it 'ids' do
    expect(@link.ids[0].class).to eq Integer
  end

  it 'tab' do
    @link.tab_index
    expect(@link.tab[0].url.include?("http")).to eq true
  end

  it 'format' do
    @link.import
    expect(@link.format[0].keys).to eq %i[title url created tags]
  end

  fit 'save' do
    @link.save
    file = File.read('2021-10-10-links.rb')

    expect(file).to eq true
  end
end

