module FamilyMembersHelper
  def get_relationship_options(family_member)
    options = [['Parent'], ['Child']]
    options << ['Grandchild'] unless family_member.children.empty?
    options << ['Grandparent'] unless family_member.parent.nil?
    options
  end

  def count_relationships
    @family_member.descendants.count + @family_member.ancestors.count
  end
end
