# frozen_string_literal: true

# Find nodes where the namespace starts with a certain string.
class StartWithFinder
  def initialize(source)
    super source
  end

  def of_source?(item)
    item&.to_s&.start_with?(@source)
  end
end
