require 'rails_helper'

RSpec.describe "family_members/new", :type => :view do
  before(:each) do
    assign(:family_member, FamilyMember.new(
      :name => "MyText",
      :email => "MyText"
    ))
  end

  it "renders new family_member form" do
    render

    assert_select "form[action=?][method=?]", family_members_path, "post" do

      assert_select "textarea#family_member_name[name=?]", "family_member[name]"

      assert_select "textarea#family_member_email[name=?]", "family_member[email]"
    end
  end
end
