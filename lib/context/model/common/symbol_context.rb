require_relative '../a_context'

class SymbolContext < AContext

  def self.default_attributes(key_symbol = :no_setup)
    attr = {}
    attr[key_symbol.to_sym] = :value
    attr
  end

  def self.create_symbol(key)
    source = 'Symbol'
    create source, key
  end

  def self.create(source, key)
    model = nil
    attributes = SymbolContext.default_attributes key
    SymbolContext.new model, source, attributes
  end

  def initialize(model = nil, source = 'Symbol',
                 attributes = SymbolContext.default_attributes,
                 child_contexts = nil, excluded = [])
    super model, source, attributes, child_contexts, excluded
  end
end
