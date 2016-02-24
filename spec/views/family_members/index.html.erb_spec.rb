require 'rails_helper'

RSpec.describe "family_members/index", :type => :view do
  before(:each) do
    assign(:family_members, [
      FamilyMember.create!(
        :name => "MyText",
        :email => "MyText"
      ),
      FamilyMember.create!(
        :name => "MyText",
        :email => "MyText"
      )
    ])
  end

  it "renders a list of family_members" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
