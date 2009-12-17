class Question < ActiveRecord::Base
  validates_presence_of :user_id
  validates_length_of :question, :minimum => 10
end
