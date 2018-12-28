# frozen_string_literal: true

require_relative 'a_context'

# Context to represent name space imports of a node
class NamespaceContext < AContext
  def initialize(model = :Namespace,
                 source = 'ClassMap',
                 job = :Create)
    super model, source, job
  end
end
