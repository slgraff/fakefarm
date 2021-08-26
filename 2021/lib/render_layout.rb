require 'yaml'
require 'erb'
require '../lib/render_nav'
require '../root'

class RenderLayout
  def initialize(frame, page)
    template = File.join(__dir__,"..", "templates", "layout.html.erb")
    @frame = frame
    @page = page
    @template = File.read(template)
  end

  attr_reader :data

  def title
    # @data['nav']
  end

  def stylesheet
    @page['stylesheet']
  end

  def nav
    nav_config = YAML.load(File.read(File.join(ROOT, "nav.yml")))
    RenderNav.new(nav_config).build
  end

  def frame
    @frame.build
  end

  def build
    ERB.new(@template).result(binding)
  end
end