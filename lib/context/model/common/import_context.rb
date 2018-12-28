require_relative '../a_context'

class ImportContext < AContext

  def self.default_attr
    attr = {}
    attr[:partial] = 'partialName'
    attr[:resolved] = 'resolvedName'
    attr[:assembly] = 'assemblyName'
    attr
  end

  def initialize(model_type = :Import,
                 xml_type = 'ClassMap',
                 attributes = ImportContext.default_attr,
                 child_contexts = nil, excluded = [])
    super model_type, xml_type, attributes, child_contexts, excluded
  end
end
