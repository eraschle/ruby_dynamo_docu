# frozen_string_literal: true

# Provider for accessing source data
class AProvider
  def initialize(repository, source_attr)
    @repository = repository
    @source_attr = source_attr
  end

  def value(_item)
    raise 'abstract method'
  end
end
