class RenderData
  def initialize(config)
    template = File.join(__dir__,"..", "templates", config['verse_template'])
    data = config['verses']
    @template = File.read(template)
    @data = YAML.load(File.read(data))
  end

  attr_reader :data

  def title
    @data['title']
  end

  def build
    ERB.new(@template).result(binding)
  end
end