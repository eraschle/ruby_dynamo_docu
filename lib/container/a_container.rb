# frozen_string_literal: true

# A Container to find source related objects
class AContainer
  def initialize
    @elements = []
  end

  def add(item)
    msg = "not implemented method 'of_source'"
    raise msg unless item.respons_to? :of_source?

    @elements << item unless by(item).nil?
  end

  def by(source)
    nil if source.nil?
    @elements.find { |ele| ele.of_source?(source) }
  end
end
