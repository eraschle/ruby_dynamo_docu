# frozen_string_literal: true

require 'require_all'
require_all 'lib/models/nodes'
require_all 'lib/models/nodes/lists'
require_all 'lib/models/common'
require_relative 'helpers/class_helper'
require_relative './factories/context_factory'

# Builds a new object an sets all attributes values
class Builder
  def initialize(repo)
    @repo = repo
  end

  def build(source)
    context = ContextFactory.by_source source
    model = new_entity context
    apply_attributes model, source, context
  rescue NoMethodError => e
    raise "build\n#{source}\n#{context.source}\n#{e.message}"
  end

  private

  def new_entity(context, params = nil)
    module_symbol = :Documentation
    ClassHelper.new_instance(module_symbol, context.model, params)
  end

  def apply_attributes(model, source, context)
    context.model_attributes.each do |attr|
      provider = context.provider attr
      value = provider.value source
      ClassHelper.dynamic_set(model, attr, value) unless value.nil?
    end
    model
  end
end
