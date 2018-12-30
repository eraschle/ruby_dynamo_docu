# frozen_string_literal: true

# A general context of dynamo source
class EqualsFinder

  def initialize(source)
    @source = source
  end

  def of_source?(item)
    @source == item
  end

end
