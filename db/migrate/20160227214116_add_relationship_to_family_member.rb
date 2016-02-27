class AddRelationshipToFamilyMember < ActiveRecord::Migration
  def change
    add_column :family_members, :relationship, :string
  end
end
