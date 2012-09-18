# # # YAML
# # # http://teamtreehouse.com/library/programming-2/ruby-foundations/ruby-standard-library/yaml

# # # require (and name of library)
# # # YAML lets you serialize



# # File.open('./config.yml', 'w') do |config|
# #     config.puts hash.to_yaml
# #   end

# # # FileUtils
# # # http://teamtreehouse.com/library/programming-2/ruby-foundations/ruby-standard-library/fileutils

# # # in IRB
# # # need to require it -> require 'fileutils'

# # # mostly deal with copying, moving, fileutils

# # FileUtils.touch 'file1'
# # # Creates a new file1

# # FileUtils.cp 'file1', 'file2'


# # # Logger
# # # http://teamtreehouse.com/library/programming-2/ruby-foundations/ruby-standard-library/logger

# require 'logger'

# class BankAccount
#     attr_accessor :logger

#     def initialize(name)
#       @name = name
#       @transactions = []
#       @logger = Logger.new(STDOUT)
#     end

#     def deposit(amount)
#       logger.debug "Depositing #{amount}"
#       @transactions.push(amount)
#     end

#     def withdraw(amount)
#       logger.debug "withdrawing #{amount}"
#       @transactions.push(-amount)
#     end
# end

# account = BankAccount.new('Jason Seifer')
# account.deposit(100)
# account.withdraw(50)


# # Mini test
# # http://teamtreehouse.com/library/programming-2/ruby-foundations/testing/minitest

require "minitest/autorun"

class MyTest < Minitest::Unit::TestCase
  def test_that_addition_works
    assert_equal 4, 2+2
  end

  def test_that_my_array_has_a_value
    my_array = %w(dog cat frog)
    assert my_array.include?('frog')
  end

  def test_assert_delta
    assert_in_delta 3.14149, 3, 0.2
  end

  def test_assert_match
    assert_match /world/, 'hello world'
  end

  def test_nil
    some = nil
    assert_nil some
  end

  def test_respond
    assert_respond_to Array.new, 'include?'
  end

end


# http://ruby.railstutorial.org/book/ruby-on-rails-tutorial#code-sessions_resource






















































