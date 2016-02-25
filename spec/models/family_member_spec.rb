require 'rails_helper'

describe FamilyMember do
  context "valid attributes" do
    let(:family_member) { FamilyMember.new(name: "Name", email: "name@example.com") }

    it "has a name" do
      expect(family_member.name).to eq("Name")
    end

    it "has an email address" do
      expect(family_member.email).to eq("name@example.com")
    end
  end

  context "invalid attributes" do
    it "is invalid without a name" do
      no_name = FamilyMember.new(name: nil, email: "name@example.com")
      expect(no_name).to_not be_valid
    end

    it "has an email address" do
      no_email = FamilyMember.new(name: "Name", email: nil)
      expect(no_email).to_not be_valid
    end
  end
end
