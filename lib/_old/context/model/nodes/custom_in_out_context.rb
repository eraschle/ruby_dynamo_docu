# frozen_string_literal: true

require_relative 'node_context'
require_relative '../../config/a_config'
require_relative '../common/symbol_context'
require_relative '../../parser/symbol_parser'

# parent class for all all possible dynamo nodes
class CustomInOutContext < NodeContext
  def self.merge_symbol_name
    key_suffix = 'name'
    AConfig.create_merge_symbol key_suffix
  end

  def self.merge_symbol_description
    key_suffix = 'description'
    AConfig.create_merge_symbol key_suffix
  end

  def self.merge_symbol_type
    key_suffix = 'type'
    AConfig.create_merge_symbol key_suffix
  end

  def self.default_attributes
    attributes = {}
    attributes[:kind] = :xml_element_name
    attributes[:name] = CustomInOutContext.merge_symbol_name
    attributes[:description] = CustomInOutContext.merge_symbol_description
    attributes[:type] = CustomInOutContext.merge_symbol_type
    attributes
  end

  def self.default_child_contexts
    child = {}
    child = add_child(child, CustomInOutContext.merge_symbol_name)
    child = add_child(child, CustomInOutContext.merge_symbol_description)
    child = add_child(child, CustomInOutContext.merge_symbol_type)
    child
  end

  def self.add_child(map, key)
    map[key] = SymbolContext.create_symbol key
    map
  end

  def self.create(source)
    model_type = :CustomNodeInputOutput
    CustomInOutContext.new model_type, source
  end

  def initialize(model_type, source_type,
                 attributes = CustomInOutContext.default_attributes,
                 child_contexts = CustomInOutContext.default_child_contexts,
                 excluded = [],
                 symbol_parser = SymbolParser.new)
    super model_type, source_type, attributes, child_contexts, excluded
    @symbol_parser = symbol_parser
  end

  def model_value(model_attr, value)
    model_attr = model_attr.to_sym
    value = super(model_attr, value)
    value = @symbol_parser.kind_value model_attr, value
    value = @symbol_parser.name_value model_attr, value
    value = @symbol_parser.description_value model_attr, value
    @symbol_parser.type_value model_attr, value
  end
end
