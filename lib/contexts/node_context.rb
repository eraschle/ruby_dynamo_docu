# frozen_string_literal: true

require_relative 'a_context'
require_relative '../providers/attribute_provider'
require_relative '../providers/value_boolean_provider'
require_relative '../providers/value_provider'

# parent class for all all possible dynamo nodes
class NodeContext < AContext
  def initialize(model, source)
    super model, source
    add_common
  end

  private

  def add_common
    bool_provider = ValueBooleanProvider.new
    add :uid, 'guid'
    add :title, 'nickname'
    add :xml_type, 'type'
    add :lacing, 'lacing'
    add :frozen, 'IsFrozen', bool_provider
    add :visible, 'isVisible', bool_provider
    add :selected_input, 'isSelectedInput', bool_provider
  end

  def add(model, source, provider = ValueProvider.new)
    attr_provider = AttributeProvider.new source
    attr_provider.value_provider = provider
    add_provider model, attr_provider
  end
end
