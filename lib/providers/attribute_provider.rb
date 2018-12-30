# frozen_string_literal: true

require_relative './value_provider'

# Provider to get access to a source attribute value
class AttributeProvider
  attr_accessor :repository, :value_provider
  def initialize(attribute_name, value_provider = ValueProvider.new)
    @attribute = attribute_name
    @value_provider = value_provider
  end

  def value(source)
    element = attribute_element source
    value = attribute_value element
    @value_provider.value value
  end

  protected

  def attribute_value(element)
    @repository.attribute_value element, @attribute
  end

  def attribute_element(source)
    source
  end
end
