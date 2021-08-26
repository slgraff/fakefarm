require 'erb'
require 'yaml'
require '../lib/render_data'

class RenderPage
  def initialize(config)
    comments = config['comments']
    template = config['page']
    data = config['data']
    @comments = File.read(comments)
    @template = File.read(template)
    @data = data
    @config = config
  end

  attr_reader :comments, :data

  def data_template
    @data_template ||= RenderData.new(@config)
  end

  def title
    data_template.title
  end

  def data
    data_template.build
  end

  def build
    ERB.new(@template).result(binding)
  end
end
