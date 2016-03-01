module FamilyMembersHelper
  def get_relationship_options(family_member)
    options = [['Parent'], ['Child']]
    options << ['Grandchild'] unless family_member.children.empty?
    options << ['Grandparent'] unless family_member.parent.nil?
    options
  end

  def get_parents
    @family_member.parent != nil ? @family_member.parent : nil
  end

  def get_children
    @family_member.children != [] ? @family_member.children : []
  end

  def get_grandparents
    puts "************* #{@family_member.parent} *****"
    @family_member.grandparent != nil ? @family_member.grandparent : nil
  end

  def get_grandchildren
    return [] if @family_member.grandchildren == nil
    @family_member.grandchildren != [] ? @family_member.grandchildren : []
  end

  def count_relationships
    @family_member.descendants.count + @family_member.ancestors.count
  end
end
