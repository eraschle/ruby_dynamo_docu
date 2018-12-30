# frozen_string_literal: true

# Default value provider
class ValueBooleanProvider
  def value(value)
    false unless value.nil?
    low_value = value.down
    bool_value = low_value == 'true'
    bool_value |= low_value == 'ja'
    bool_value
  end
end
