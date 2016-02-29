class FamilyMember < ActiveRecord::Base
  acts_as_nested_set

  has_many :messages, dependent: :destroy
  accepts_nested_attributes_for :messages

  validates :name, :presence => true
  validates :email, :presence => true

  def self.set_relationship(relative, relationship, family_member)
    case relationship
    when "Parent"
      set_as_parent(relative, family_member)
    when "Child"
      set_as_child(relative, family_member)
    when "Grandparent"
      set_as_grandparent(relative, family_member)
    when "Grandchild"
      set_as_grandchild(relative, family_member)
    else
    end
  end

  def grandchildren
    self.children != [] ? self.children.first.children : nil
  end

  def grandparent
    self.parent != nil ? self.parent.parent : nil
  end

  def self.search(search)
    where("name LIKE ?", "%#{search}%") 
  end

  private

  def self.set_as_child(relative, family_member)
    relative.move_to_child_of(family_member)
  end

  def self.set_as_parent(relative, family_member)
    family_member.move_to_child_of(relative)
  end

  def self.set_as_grandparent(relative, family_member)
    family_member.parent.move_to_child_of(relative)
  end

  def self.set_as_grandchild(relative, family_member)
    relative.move_to_child_of(family_member.children.first)
  end

end
