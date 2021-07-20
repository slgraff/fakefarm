require '../lib/convert'
require '../lib/render_page'
require '../lib/render_layout'

config = YAML.load(File.read('config.yml'))
file_name = config['output']

# convert raw data to visual data
Convert.new(config).call

# move visual data into html data
frame = RenderPage.new(config)
page = config

# confine html data to univeral contextual html
layout = RenderLayout.new(frame, page)

# make it so
File.write(file_name, layout.build)