# frozen_string_literal: true

require_relative '../providers/attribute_provider'
require_relative '../container/equals_finder'

# A general context of dynamo source
class AContext
  attr_accessor :finder
  attr_reader :model, :source

  def initialize(model, source)
    @model = model
    @source = source
    @attributes = {}
    @finder = EuqalsFinder.new @source
  end

  def model_exist?
    !@model.nil?
  end

  def source_exist?
    !@source.nil?
  end

  def of_source?(item)
    @finder.of_source? item
  end

  def add_provider(model_attr, provider)
    msg = '2nd parameter must be a attribute provider'
    raise msg unless provider.is_a? AttributeProvider

    @attributes[model_attr.to_sym] = provider
  end

  def get_provider(model_attr)
    @attributes[model_attr.to_sym]
  end

  def model_attributes
    @attributes.keys
  end

  def provider_exist?(model_attr)
    false if model_attr.nil?
    @attributes.key? model_attr.to_sym
  end
end
