# frozen_string_literal: true

require_relative '../a_context'
require_relative '../providers/attribute_provider'

# Context for code
class CodeContext < AContext
  def initialize(model = :Code, source = 'Script')
    super model, source
    add_provider :code, AttributeProvider.new :xml_inner_value
  end
end
