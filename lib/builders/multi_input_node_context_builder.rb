# frozen_string_literal: true

require_relative 'node_context'
require_relative '../providers/attribute_provider'

# Builder for an node context
class MultiInputNodeContextBuilder
  def self.create(source)
    context = NodeContext.new :MultiInputNode, source
    add_providers(context)
    context
  end

  def self.add_providers(context)
    provider = AttributeProvider.new 'inputcount'
    context.add_provider :input_count, provider
  end
end
