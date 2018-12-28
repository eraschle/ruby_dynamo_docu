require_relative '../a_context'
require_relative '../common/system_type_context'

class FormulaContext < AContext

  def self.merge_symbol_formula
    key_suffix = 'formula'
    AConfig.create_merge_symbol key_suffix
  end

  def self.default_child_contexts
    child = {}
    key = FormulaContext.merge_symbol_formula
    child = FormulaContext.add_child(child, key, :xml_inner_value)
    child
  end

  def self.add_child(map, key, value = nil)
    source = 'FormulaText'
    context = SystemTypeContext.create source, key, value
    map[key] = context
    map
  end

  def self.default_attributes
    attr = {}
    attr[:formula] = FormulaContext.merge_symbol_formula
    attr
  end

  def initialize(model_type = nil, xml_type = 'DSCoreNodesUI.Formula',
                 attributes = FormulaContext.default_attributes,
                 child_contexts = FormulaContext.default_child_contexts,
                 excluded = [])
    super model_type, xml_type, attributes, child_contexts, excluded
  end

end
