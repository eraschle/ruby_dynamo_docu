require_relative '../../helpers/parse_helper'

# common information of a dynamo node
class Node

  attr_accessor :uid, :title, :xml_type, :lacing

  def initialize
    @frozen, @visible = false
  end

  def frozen=(frozen)
    @frozen = ParseHelper.string_to_bool frozen
  end

  def frozen?
    @frozen
  end

  def visible=(visible)
    @visible = ParseHelper.string_to_bool visible
  end

  def visible?
    @visible
  end

  def selected_input=(selected_input)
    @selected_input = ParseHelper.string_to_bool selected_input
  end

  def selected_input?
    @selected_input
  end
end
