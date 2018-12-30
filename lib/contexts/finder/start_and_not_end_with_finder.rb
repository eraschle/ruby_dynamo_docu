# frozen_string_literal: true

# A general context of dynamo include
class StartsAndNotEndWithFinder

  def initialize(include, exclude)
    @include = include
    @exclude = exclude
  end

  def allowed?(item)
    allowed_includes(item) && allowed_excludes(item)
  end

  def allowed_includes(item)
    item.start_with? @include
  end

  def allowed_excludes(item)
    @exclude.any? { |ex| item.include? ex}
  end

end
