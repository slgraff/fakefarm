require 'yaml'

file = File.open('./yaml.erb.yaml')
yaml = YAML.load(file)
puts yaml
