require 'erb'

class Template
  def initialize(raw, markup=nil)
    @raw = raw
    file = File.join('.', 'spec', '2021', 'name', 'fixtures', 'basic_template.erb')
    @markup = File.read(file)
  end

  def template
    renderer = ERB.new(@markup)
    renderer.result(binding)
  end
end