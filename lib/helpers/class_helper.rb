# frozen_string_literal: true

class ClassHelper
  def self.ancestors(object)
    object.class.ancestors
  end

  def self.ancestors_gem(object)
    all = ancestors object
    all.slice(0, all.index(Object))
  end

  def self.new_class(superclass, class_name)
    unless Object.const_defined? class_name
      new_class = Class.new superclass
      Object.const_set(class_name, new_class)
    end
    Object.const_get class_name.to_sym
  end

  def self.new_instance(module_name, class_name, params)
    namespace = Object.const_get(module_name.to_sym)
    instance = namespace.const_get(class_name.to_sym)
    params.nil? ? instance.new : instance.new(params)
  end

  def self.class_name(prefix, superclass)
    prefix = prefix.lower
    "#{prefix.capitalize}#{superclass.name}"
  end

  def self.dynamic_set(instance, variable, value)
    instance.send("#{variable}=", value)
  end

  def self.dynamic_get(instance, variable)
    instance.send(variable)
  end
end
