require 'spec_helper'

describe Question do
  before(:each) do
    @valid_attributes = {
      :user_id => 1,
      :question => "value for question",
      :disable => false
    }
  end

  it "should create a new instance given valid attributes" do
    Question.create!(@valid_attributes)
  end
  
  describe 'ready_to_go' do
    it "should get the right ones and sorted properly" do
      @a = Question.create!(@valid_attributes.merge(:created_at => 2.minutes.ago))
      @b = Question.create!(@valid_attributes)
      @c = Question.create!(@valid_attributes.merge(:created_at => 3.minutes.ago, :disable => true))
      Question.ready_to_go.length.should eql(2)
      Question.ready_to_go.should == [@b, @a]
    end
  end
end
