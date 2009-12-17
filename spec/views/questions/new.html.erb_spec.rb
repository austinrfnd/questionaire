require 'spec_helper'

describe "/questions/new.html.erb" do
  include QuestionsHelper

  before(:each) do
    assigns[:question] = stub_model(Question,
      :new_record? => true,
      :user_id => 1,
      :question => "value for question",
      :disable => false
    )
  end

  it "renders new question form" do
    render

    response.should have_tag("form[action=?][method=post]", questions_path) do
      with_tag("input#question_user_id[name=?]", "question[user_id]")
      with_tag("textarea#question_question[name=?]", "question[question]")
      with_tag("input#question_disable[name=?]", "question[disable]")
    end
  end
end
