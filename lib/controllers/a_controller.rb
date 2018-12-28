require_relative '../dynamo_repo'

class AController
  attr_reader :parent, :contexts, :not_managed
  attr_accessor :repository

  def initialize(parent, contexts)
    @parent = parent
    @contexts = contexts
    @not_managed = {}
    @not_managed.default = {}
  end

  def source_context(source)
    source_sym = repository.xml_symbol source
    context = managed_contexts source_sym
    context = managed_child_contexts source_sym if context.nil?
    context
  end

  def managed?(source)
    return false if source.nil?
    source_key = repository.xml_symbol source
    managed = managed_contexts? source_key
    managed |= managed_child_contexts? source_key unless managed
    add_not_managed source_key, source unless managed
    managed
  end

  private

  def add_not_managed(key, source)
    not_man = @not_managed[key]
    not_man = create_new_not_managed(source).merge(not_man)
    @not_managed[key] = not_man
  end

  def create_new_not_managed(source)
    new_entry = {}
    new_entry['source'] = source
    new_entry['children'] = repository.all_children(source)
    new_entry
  end

  def managed_child_contexts?(source)
    !managed_child_contexts(source).nil?
  end

  def managed_child_contexts(source)
    managed = nil
    @contexts.each_key do |key|
      context = @contexts[key]
      child_context = context.child_context_by_source source
      next if child_context.nil?
      managed = child_context
      break
    end
    managed
  end

  def managed_contexts?(source)
    !managed_contexts(source).nil?
  end

  def managed_contexts(source)
    managed = nil
    @contexts.each_key do |key|
      context = @contexts[key]
      next unless context.of_source? source
      managed = context
      break
    end
    managed
  end
end
