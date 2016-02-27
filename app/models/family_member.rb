class FamilyMember < ActiveRecord::Base
  has_many :messages, dependent: :destroy
  accepts_nested_attributes_for :messages

  validates :name, :presence => true
  validates :email, :presence => true
  validates :relationship, :presence => true
end
