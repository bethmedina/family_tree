require 'rails_helper'

RSpec.describe "family_members/edit", :type => :view do
  before(:each) do
    @family_member = assign(:family_member, FamilyMember.create!(
      :name => "MyText",
      :email => "MyText"
    ))
  end

  it "renders the edit family_member form" do
    render

    assert_select "form[action=?][method=?]", family_member_path(@family_member), "post" do

      assert_select "textarea#family_member_name[name=?]", "family_member[name]"

      assert_select "textarea#family_member_email[name=?]", "family_member[email]"
    end
  end
end
