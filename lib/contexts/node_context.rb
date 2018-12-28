# frozen_string_literal: true

require_relative 'a_context'
require_relative '../providers/attribute_provider'

# parent class for all all possible dynamo nodes
class NodeContext < AContext
  def initialize(model = :Node,
                 source = '')
    super model, source
    add_common
  end

  private

  def add_common
    add_provider :uid, AttributeProvider.new('guid')
    add_provider :title, AttributeProvider.new('nickname')
    add_provider :xml_type, AttributeProvider.new('type')
    add_provider :lacing, AttributeProvider.new('lacing')
    add_provider :frozen, AttributeProvider.new('IsFrozen')
    add_provider :visible, AttributeProvider.new('isVisible')
    add_provider :selected_input, AttributeProvider.new('isSelectedInput')
  end
end
