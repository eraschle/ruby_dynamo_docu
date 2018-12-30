# frozen_string_literal: true

require_relative '../config/a_config'
# mother of all contexts
class AContext
  attr_reader :model, :source, :attributes

  def initialize(model, source, attributes, child_context, exclude)
    @model = model
    @source = source.to_sym
    @attributes = attributes.nil? ? {} : attributes
    @children_contexts = child_context
    @excluded = exclude.nil? ? {} : exclude
  end

  def model_exist?
    @model != nil
  end

  def source_exist?
    @source != nil
  end

  def model_value(_model_attr, value)
    value
  end

  def of_source?(element)
    source_exist? && !excluded?(element) && @source == element.to_sym
  rescue StandardError
    false
  end

  def excluded?(element)
    return false if @excluded.empty?

    @excluded.find_all { |ele| element.to_s == ele }.count > 0
  end

  def children_context_exist?
    !@children_contexts.nil? && !@children_contexts.empty?
  end

  def children_context_keys
    @children_contexts.keys
  end

  def child_context_by_key(key)
    @children_contexts[key.to_sym]
  end

  def child_context_by_source(source)
    return nil unless children_context_exist?

    managed = nil
    children_context_keys.each do |child_key|
      child_context = child_context_by_key(child_key)
      next unless child_context.of_source? source

      managed = child_context
      break
    end
    managed
  end

  def build_symbol?(build_symbol)
    return false unless symbol_check build_symbol.to_sym

    build_symbol.to_s.start_with? AConfig.build_prefix.to_s
  end

  def merge_symbol?(merge_symbol)
    return false unless symbol_check merge_symbol.to_sym

    merge_symbol.to_s.start_with? AConfig.merge_prefix.to_s
  end

  private

  def symbol_check(symbol)
    !symbol.nil? && children_context_exist?
  end
end
