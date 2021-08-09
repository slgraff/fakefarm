require_relative './script'

raw =  File.join('.', '2021', 'name', 'data','my_name_raw.rb')

output =  File.join('.', '2021', 'name', 'index.html')
template = File.join('.', '2021', 'name', 'views', 'index.erb')

Script.new(raw: raw, output: output, template: template).html


`open http://localhost:8000/2021/name`
