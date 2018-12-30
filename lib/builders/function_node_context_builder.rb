# frozen_string_literal: true

require_relative 'node_context'
require_relative '../providers/attribute_child_provider'

# Builder for an node context
class FunctionNodeContextBuilder
  def self.create(source)
    context = NodeContext.new :FunctionNode, source
    provider = ChildAttributeProvider.new 'ID', 'value'
    context.add_provider :function_id, provider
    provider = ChildAttributeProvider.new 'Name', 'value'
    context.add_provider :function_name, provider
    provider = ChildAttributeProvider.new 'Description', 'value'
    context.add_provider :description, provider
    context
  end
end
