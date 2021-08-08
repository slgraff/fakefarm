require_relative './script'

raw =  File.join('.', '2021', 'name', 'data','my_name_raw.rb')

output =  File.join('.', '2021', 'name', 'index.html')

Script.new(raw: raw, output: output).html