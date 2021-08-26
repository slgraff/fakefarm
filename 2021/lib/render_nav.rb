require 'yaml'
require 'erb'
require '../root'

class RenderNav
  def initialize(config)
    template = File.join(__dir__,"..", "templates", "_nav.html.erb")
    @template = File.read(template)
    @data = config
  end

  attr_reader :data

  def title
    # @data['nav']
  end

  def build
    ERB.new(@template).result(binding)
  end
end
