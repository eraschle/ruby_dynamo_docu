require_relative '../a_context'

class CodeContext < AContext

  def self.default_attributes
    attr = {}
    attr[:code] = :xml_inner_value
    attr
  end

  def initialize(model_type = :Code,
                 xml_type = 'Script',
                 attributes = CodeContext.default_attributes,
                 child_contexts = nil, excluded = [])
    super model_type, xml_type, attributes, child_contexts, excluded
  end

end
