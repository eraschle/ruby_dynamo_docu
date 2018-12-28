# frozen_string_literal: true

require_relative './data_source'

# Data Access Object for Dynamo Sources
class DynamoDao
  def initialize(data_source = DataSource.new)
    @data_source = data_source
  end

  def source_name(source)
    return 'nil' if source.nil?

    source.respond_to?(:name) ? source.name : source.to_s
  end

  def children(source)
    source.children.find_all { |ele| element? ele }
  end

  def child_by_name(source, name)
    child_by source, name
  end

  def root_child_by_name(name)
    child_by @data_source.root, name
  end

  def source_attribute(source, attribute)
    symbol = attribute.to_sym
    if symbol == :xml_inner_value
      source.text
    elsif symbol == :xml_element_name
      source_name source
    else
      source.attributes[attribute.to_s]
    end
  end

  private

  def element?(item)
    @data_source.source_element? item
  end

  def child_by(source, name)
    values = children(source).to_a { |ele| source_name(ele) == name }
    values.empty? ? values : values[0]
  end
end
