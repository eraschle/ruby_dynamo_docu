# frozen_string_literal: true

# Default value provider
class ValueIntegerProvider
  def value(value)
    value.to_i
  end
end
