require 'spec_helper'

describe "/questions/edit.html.erb" do
  include QuestionsHelper

  before(:each) do
    assigns[:question] = @question = stub_model(Question,
      :new_record? => false,
      :user_id => 1,
      :question => "value for question",
      :disable => false
    )
  end

  it "renders the edit question form" do
    render

    response.should have_tag("form[action=#{question_path(@question)}][method=post]") do
      with_tag('input#question_user_id[name=?]', "question[user_id]")
      with_tag('textarea#question_question[name=?]', "question[question]")
      with_tag('input#question_disable[name=?]', "question[disable]")
    end
  end
end
