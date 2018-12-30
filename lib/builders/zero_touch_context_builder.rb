# frozen_string_literal: true

require_relative 'node_context'
require_relative '../providers/attribute_child_provider'

# Builder for an node context
class ZeroTouchContextBuilder
  def self.create(source)
    context = NodeContext.new :ZeroTouchNode, source
    provider = AttributeProvider.new 'assembly'
    context.add_provider :assembly, provider
    provider = AttributeProvider.new 'function'
    context.add_provider :function, provider
    provider = AttributeProvider.new 'ports'
    context.add_provider :ports, provider
    context
  end
end
