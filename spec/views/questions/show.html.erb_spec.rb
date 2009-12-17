require 'spec_helper'

describe "/questions/show.html.erb" do
  include QuestionsHelper
  before(:each) do
    assigns[:question] = @question = stub_model(Question,
      :user_id => 1,
      :question => "value for question",
      :disable => false
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/1/)
    response.should have_text(/value\ for\ question/)
    response.should have_text(/false/)
  end
end
