class Question < ActiveRecord::Base
  attr_accessible :question, :size, :topic, :visibility
end
