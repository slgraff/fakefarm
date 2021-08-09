require 'erb'

class Template
  def initialize(raw, template, markup=nil)
    @raw = raw
    file = template
    @markup = File.read(file)
  end

  def template
    renderer = ERB.new(@markup)
    renderer.result(binding)
  end
end