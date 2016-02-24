require 'rails_helper'

RSpec.describe "family_members/show", :type => :view do
  before(:each) do
    @family_member = assign(:family_member, FamilyMember.create!(
      :name => "MyText",
      :email => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
