# frozen_string_literal: true

require_relative 'node_context'
require_relative '../providers/attribute_provider'

# Builder for an node context as a code block context
class CodeBlockContextBuilder
  def self.create(source)
    provider = AttributeProvider.new 'CodeText'
    context = NodeContext.new :CodeBlock, source
    context.add_provider :code, provider
    context
  end
end
