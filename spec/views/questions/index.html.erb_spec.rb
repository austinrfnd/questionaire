require 'spec_helper'

describe "/questions/index.html.erb" do
  include QuestionsHelper

  before(:each) do
    assigns[:questions] = [
      stub_model(Question,
        :user_id => 1,
        :question => "value for question",
        :disable => false
      ),
      stub_model(Question,
        :user_id => 1,
        :question => "value for question",
        :disable => false
      )
    ]
  end

  it "renders a list of questions" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for question".to_s, 2)
    response.should have_tag("tr>td", false.to_s, 2)
  end
end
