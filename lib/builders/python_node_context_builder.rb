# frozen_string_literal: true

require_relative 'node_context'
require_relative '../providers/attribute_build_provider'
require_relative 'multi_input_node_context_builder'

# Builder for an node context
class PythonNodeContextBuilder
  def self.create(source)
    context = NodeContext.new :PythonNode, source
    MultiInputNodeContextBuilder.add_providers(context)
    provider = AttributeBuildProvider.new 'Script', :xml_inner_value
    context.add_provider :assembly, provider
    context
  end
end
