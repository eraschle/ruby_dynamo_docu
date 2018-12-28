# frozen_string_literal: true

# Class to help find the right source in a container
class EqualsFinder
  def initialize(source)
    @source = source.to_sym
  end

  def of_source?(item)
    false if item.nil?
    @source == item.to_sym
  end
end
