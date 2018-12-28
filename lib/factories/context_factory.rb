# frozen_string_literal: true

# Factory to create all the different contexts
class ContextFactory
  def initialize
    @container = AContainer.new
  end

  def add_source(source)
    nil if source.nil?
    msg = "source item does not implement 'of_source?'"
    raise msg unless source.respond_to? :of_source?

    @container.add source
  end

  def by_source(source)
    @container.by source
  end
end
