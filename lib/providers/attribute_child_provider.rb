# frozen_string_literal: true

require_relative './attribute_provider'

# Provider to get access to a source attribute value
class ChildAttributeProvider < AttributeProvider
  def initialize(child, attribute)
    super attribute
    @child = child
  end

  protected

  def attribute_element(source)
    @repository.child source, @child
  end
end
