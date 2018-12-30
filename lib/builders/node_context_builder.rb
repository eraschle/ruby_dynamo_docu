# frozen_string_literal: true

require_relative 'node_context'

# Builder for an node context
class NodeContextBuilder
  def self.create(source)
    NodeContext.new :Node, source
  end
end
