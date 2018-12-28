class ParseHelper
  def self.string_to_bool(value, value_true = 'true', value_false = 'false')
    return value if value.nil?
    value_down = value.downcase
    return false if value_down == value_false
    return true if value_down == value_true
    value
  end

  def self.string_to_int(value)
    value.nil? ? 0 : value.to_i
  rescue StandardError
    -1
  end
end
