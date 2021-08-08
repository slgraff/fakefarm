require_relative './template'

class Script
  attr_reader :raw, :output

  def initialize(raw:, output: )
    @output = output
    @raw = require_file(raw)
  end

  def template
    Template.new(@raw).template
  end

  def html
    File.write(output, template)
  end

private

  def require_file(raw)
    require raw
    RAW
  end
end