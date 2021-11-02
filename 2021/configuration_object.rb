require 'ostruct'

class MyObj
  def self.configure
    yield config
  end

  def self.config
    @config ||= OpenStruct.new
  end
end

MyObj.configure do |config|
  config.setting = true
  config.belief = 'Torah'
  config.nation = 'Israel'
end

MyObj.config.nation # => "Israel"

