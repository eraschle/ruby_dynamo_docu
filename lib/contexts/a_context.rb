# frozen_string_literal: true

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
    not_nil? @model
  end

  def source_exist?
    not_nil? @source
  end

  def of_source?(item)
    @finder.of_source? item
  end

  def add_provider(model, provider)
    msg = '2nd parameter must be a provider'
    raise msg unless provider.is_a? AProvider

    @attributes[model.to_sym] = provider
  end

  def model_attributes
    @attributes.keys
  end

  def provider_exist?(model_attr)
    false if model_attr.nil?
    @attributes.key? model_attr
  end

  def get_provider(model_attr)
    @attributes[model_attr]
  end

  protected

  def not_nil?(item)
    !item.nil?
  end
end
