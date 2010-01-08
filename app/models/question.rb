class Question < ActiveRecord::Base
  # validates_presence_of :user_id
  validates_length_of :question, :minimum => 10
  
  # Find the undisabled questions within the last 5 minutes sorted by created_at
  named_scope :ready_to_go, :conditions => ["disable = ? AND created_at > ? AND created_at < ?", false, 2.minutes.ago, 1.minute.ago], :limit => 50, :order => "created_at DESC"
  named_scope :all_ready_to_go, :conditions => ["disable = ? AND created_at > ?", false, 1.minute.ago], :order => "created_at DESC"
end
