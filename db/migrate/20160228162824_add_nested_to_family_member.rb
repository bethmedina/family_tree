class AddNestedToFamilyMember < ActiveRecord::Migration
  def self.up
    add_column :family_members, :parent_id, :integer 
    add_column :family_members, :lft,       :integer
    add_column :family_members, :rgt,       :integer

    # optional fields
    add_column :family_members, :depth,          :integer
    add_column :family_members, :children_count, :integer

    # This is necessary to update :lft and :rgt columns
    FamilyMember.rebuild!
  end

  def self.down
    remove_column :family_members, :parent_id
    remove_column :family_members, :lft
    remove_column :family_members, :rgt

    # optional fields
    remove_column :family_members, :depth
    remove_column :family_members, :children_count
  end
end
