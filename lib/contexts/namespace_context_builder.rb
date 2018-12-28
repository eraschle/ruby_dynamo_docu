# frozen_string_literal: true

require_relative 'namespace_context'

# Builder for an name space context
class NamespaceContextBuilder
  def self.create(source)
    NamespaceContext.new :Namespace, source
  end
end
