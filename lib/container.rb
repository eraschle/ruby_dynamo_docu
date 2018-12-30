# frozen_string_literal: true

# A Container to find source related objects
class Container
  def initialize
    @elements = []
  end

  def add(item)
    msg = 'item can NOT be added...'
    raise msg unless can_add? item

    @elements << item
  end

  def by(source)
    return nil if source.nil?

    items = @elements.select { |ele| ele.of_source?(source) }
    return nil if items.nil? || items.empty?

    items
  end

  private

  def can_add?(item)
    !item.nil? && item.respons_to?(:of_source?) && by(item).nil?
  end
end
