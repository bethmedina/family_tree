class FamilyMember < ActiveRecord::Base
  acts_as_nested_set

  has_many :messages, dependent: :destroy
  accepts_nested_attributes_for :messages

  validates :name, :presence => true
  validates :email, :presence => true

  def self.set_relationship(relative, relationship, family_member)
    case relationship
    when "Parent" then set_as_parent(relative, family_member)
    when "Child" then set_as_child(relative, family_member)
    else "Unknown"
    end
  end

  private

  def set_as_child(relative, family_member)
    relative.move_to_child_of(family_member)
    relative.parent_id = family_member.id
  end

  def set_as_parent(relative, family_member)
    family_member.move_to_child_of(relative)
    family_member.parent_id = relative.id
  end

end
