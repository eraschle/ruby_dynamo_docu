# frozen_string_literal: true

require_relative '../builders/model_builder'

# Provider to get access to a element attribute value
class AttributeBuildProvider < AttributeProvider
  def initialize(attribute)
    super attribute
  end

  def repository(repository)
    super repository
    @builder = ModelBuilder.new @repository
  end

  def attribute_value(element)
    @builder.build element
  end
end
