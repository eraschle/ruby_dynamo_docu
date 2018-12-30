# frozen_string_literal: true

require 'singleton'
require_relative 'context_config'

# Factory to create all the different contexts
class ContextFactory
  include Singleton

  def self.by_source(source)
    ContextFactory.instance.by_source source
  end

  def self.add(item)
    ContextFactory.instance.add_source item
  end

  def initialize
    @contexts  = []
    config = ContextConfig.new
    config.configure
  end

  def add_source(source)
    msg = 'item can NOT be added...'
    raise msg unless can_add? item

    @contexts << item
  end

  def by_source(source)
    return nil if source.nil?

    items = @contexts .select { |ele| ele.of_source?(source) }
    items.nil? ? nil : items
  end

  private

  def can_add?(item)
    !item.nil? && item.respons_to?(:of_source?) && by(item).nil?
  end
end
