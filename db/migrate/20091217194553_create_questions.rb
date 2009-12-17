class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.integer :user_id
      t.text :question
      t.boolean :disable, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :questions
  end
end
