require_relative 'helpers/file_helper'

class DynamoRepo
  def element_by_name(element_name)
    @doc.root.elements[element_name]
  end

  def all_children(xml_element, only_element = true)
    children = []
    xml_element.children.each do |ele|
      if only_element
        children << ele if xml_element?(ele)
      else
        children << ele
      end
    end
    children
  end

  def children(xml_element, controller, only_element = true)
    children = []
    unless xml_element.nil?
      xml_element.children.each do |ele|
        children << ele if can_add(ele, controller, only_element)
      end
    end
    children
  end

  def children_by_type(xml_element, context)
    children = []
    xml_element.children.each do |ele|
      children << ele if context.of_source?(xml_name(ele))
    end
    children
  end

  def attribute_value(element, attribute_name)
    symbol = attribute_name.to_sym
    if symbol == :xml_inner_value
      element.text
    elsif symbol == :xml_element_name
      xml_name element
    else
      element.attributes[attribute_name.to_s]
    end
  end

  def xml_element?(xml_ele)
    xml_ele.class == REXML::Element
  end

  def xml_name(xml_ele)
    type_name = 'nil'
    unless xml_ele.nil?
      type_name = xml_ele.to_s
      type_name = xml_ele.name if xml_ele.respond_to? :name
    end
    type_name
  end

  def xml_symbol(xml_ele)
    xml_name(xml_ele).to_sym
  end

  def open_file(file_path)
    @doc = FileHelper.open_xml(file_path)
  end

  private

  def element_item?(element, only_element)
    return true unless only_element
    xml_element? element
  end

  def can_add(element, controller, only_element = true)
    can_add = element_item? element, only_element
    can_add && controller.managed?(element)
  end

end
