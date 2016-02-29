module FamilyMembersHelper
  def get_relationship_options(family_member)
    options = [['Parent'], ['Child']]
    options << ['Grandchild'] unless family_member.children.empty?
    options << ['Grandparent'] unless family_member.parent.nil?
    options
  end

  def get_parents(family_member)
    @family_member.parent != nil ? @family_member.parent.name : ''
  end

  def get_children(family_member)
    @family_member.children != [] ? @family_member.children.map(&:name) : []
  end

  def get_grandparents(family_member)
    @family_member.grandparent != nil ? @family_member.grandparent.name : ''
  end

  def get_grandchildren(family_member)
    return [] if @family_member.grandchildren == nil
    @family_member.grandchildren != [] ? @family_member.grandchildren.map(&:name) : []
  end
end
