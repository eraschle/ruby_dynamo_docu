# frozen_string_literal: true

# Provider to get access to a source attribute value
class AttributeProvider < AProvider
  def initialize(repository, source_attr)
    super repository, source_attr
  end

  def value(item)
    @repository.attribute_value item, @source_attr
  end
end
