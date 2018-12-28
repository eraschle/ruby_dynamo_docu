# frozen_string_literal: true

require_relative '../node_context'

# parent class for all all possible dynamo nodes
class DropDownNodeContext < NodeContext
  def self.create(source)
    model_type = :DropDownNode
    DropDownNodeContext.new model_type, source
  end

  def self.default_attributes
    attributes = {}
    attributes[:index] = 'index'
    attributes[:value] = 'index'
    attributes
  end

  def initialize(model_type = :DropDownNode,
                 xml_type = 'DSRevitNodesUI.Categories',
                 attributes = DropDownNodeContext.default_attributes,
                 child_contexts = nil, excluded = [])
    super model_type, xml_type, attributes, child_contexts, excluded
    @separator = ':'
  end

  def model_value(model_attr, value)
    return value unless @attributes.key? model_attr
    return 'NULL' if value.nil?

    spliced = value.split @separator
    if model_attr == :index
      spliced[0]
    elsif model_attr == :value
      spliced[1]
    end
  end
end
