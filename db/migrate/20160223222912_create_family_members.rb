class CreateFamilyMembers < ActiveRecord::Migration
  def change
    create_table :family_members do |t|
      t.text :name
      t.text :email

      t.timestamps null: false
    end
  end
end
