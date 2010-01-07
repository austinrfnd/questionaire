class AddToQuestion < ActiveRecord::Migration
  def self.up
    add_column(:questions, :name, :string)
    add_column(:questions, :profile_image, :string)
  end

  def self.down
    remove_column(:questions, :name)
    remove_column(:questions, :profile_image)    
  end
end
