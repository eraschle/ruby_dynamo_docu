# frozen_string_literal: true

require_relative 'dao/dynamo_dao'

# Repository to access custom node sources
class Repository
  def initialize(dao = DynamoDao.new)
    @dao = dao
  end

  def root_child_by(name)
    @dao.root_child_by_name name
  end

  def children(parent)
    @dao.children parent
  end

  def attribute_value(source, attribute)
    @dao.source_attribute source, attribute
  end

  def child(source, child_name)
    @dao.child_by_name source, child_name
  end

  def source_element?(source)
    @dao.source_element? source
  end

  def source_name(source)
    @dao.source_name source
  end

  def source_symbol(source)
    name = source_name source
    name = 'nil' if name.nil?
    name.to_sym
  end
end
