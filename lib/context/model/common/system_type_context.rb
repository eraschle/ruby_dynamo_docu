require_relative '../a_context'

class SystemTypeContext < AContext

  def self.create(source, key, value = nil)
    model = nil
    attributes = SystemTypeContext.default_attributes key, value
    SystemTypeContext.new model, source, attributes
  end

  def self.create_system(key, value = nil)
    source = 'System'
    create source, key, value
  end

  def self.default_attributes(key_symbol = :no_setup,
                              key_value = :xml_element_name)
    value = key_value.nil? ? :xml_element_name : key_value.to_sym
    attr = {}
    attr[key_symbol.to_sym] = value
    attr
  end

  def initialize(model_type = nil, xml_type = 'System',
                 attributes = SystemTypeContext.default_attributes,
                 child_contexts = nil, excluded = [])
    super model_type, xml_type, attributes, child_contexts, excluded
    @start_with = "#{@source}."
  end

  def of_source?(element)
    element.to_s.start_with?(@start_with)
  end

  def model_value(model_attr, value)
    return value unless model_attr == :xml_element_name
    value.sub!(@start_with, '')
  end
end
