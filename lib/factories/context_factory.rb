# frozen_string_literal: true

require 'singleton'
require_relative '../container'
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
    @container = Container.new
    config = ContextConfig.new
    config.configure
  end

  def add_source(source)
    @container.add source
  end

  def by_source(source)
    @container.by source
  end
end
