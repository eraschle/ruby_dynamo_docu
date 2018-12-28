require 'require_all'
require_all 'lib/models/nodes'
require_all 'lib/models/nodes/lists'
require_all 'lib/models/common'
require_relative 'helpers/class_helper'
require_relative 'dynamo_repo'

class Builder
  def initialize(repo)
    @source_repo = repo
  end

  def build(source, controller)
    context = controller.source_context source
    model = new_entity context
    apply_attributes model, source, controller
  rescue NoMethodError => e
    raise "build\n#{source}\n#{context.source}\n#{e.message}"
  end

  private

  def new_entity(context, params = nil)
    module_symbol = :Documentation
    ClassHelper.new_instance(module_symbol, context.model, params)
  end

  def apply_attributes(model, source, controller)
    context = controller.source_context source
    context.attributes.each_key do |model_attr|
      apply_attribute model, model_attr, source, controller
    end
    model
  end

  def apply_attribute(model, model_attr, source, controller)
    value = source_attribute_value(source, model_attr, controller)
    ClassHelper.dynamic_set(model, model_attr, value) unless value.nil?
  end

  def source_attribute_value(source, model_attr, controller)
    context = controller.source_context source
    source_attr = context.attributes[model_attr]
    if context.children_context_exist? && context.build_symbol?(source_attr)
      create_child_instance source, model_attr, controller
    elsif context.children_context_exist? && context.merge_symbol?(source_attr)
      merge_child_element source, model_attr, controller
    else
      value = @source_repo.attribute_value source, source_attr
      context.model_value model_attr, value
    end
  end

  def merge_child_element(source, model_attr, controller)
    src_context = controller.source_context source
    source_attr = src_context.attributes[model_attr]
    children = children_of source, source_attr, controller
    child_context = src_context.child_context_by_key source_attr
    child_attribute = child_context.attributes[source_attr]
    value = @source_repo.attribute_value(children.first, child_attribute)
    value = child_context.model_value child_attribute, value
    src_context.model_value model_attr, value
  end

  def create_child_instance(source, model_attr, controller)
    src_context = controller.source_context source
    source_attr = src_context.attributes[model_attr]
    children = children_of(source, source_attr, controller)
    children = children.collect { |ele| build(ele, controller) }
    children.first
  end

  def children_of(source, source_attr, controller)
    src_context = controller.source_context source
    child_context = src_context.child_context_by_key source_attr
    children = @source_repo.children_by_type source, child_context
    children
  end
end
