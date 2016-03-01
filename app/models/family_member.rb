class FamilyMember < ActiveRecord::Base
  acts_as_nested_set

  has_many :messages, dependent: :destroy
  accepts_nested_attributes_for :messages

  validates :name, :presence => true
  validates :email, :presence => true

  def self.set_relationship(relative, relationship, family_member)
    case relationship.downcase.to_sym
    when :parent
      set_as_parent(relative, family_member)
    when :child
      set_as_child(relative, family_member)
    when :grandparent
      set_as_grandparent(relative, family_member)
    when :grandchild
      set_as_grandchild(relative, family_member)
    end
  end

  def grandchildren
    self.children.first.children unless self.children.blank?
  end

  def grandparent
    return nil if self.parent.blank?
    self.parent.parent unless self.parent.nil?
  end

  def self.search(search)
    where("lower(name) LIKE ?", "%#{search.downcase}%")
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
