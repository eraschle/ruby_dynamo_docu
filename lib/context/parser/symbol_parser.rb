class SymbolParser

  def initialize
    @comment_value = '//'
    @name_type_separator = ':'
    @new_line = "\n"
  end

  def kind_value(model_attr, value)
    return value unless model_attr == :kind
    value.include?('Output') ? 'OUT' : 'IN'
  end

  def name_value(model_attr, value)
    return value unless model_attr == :name
    name_val = ''
    split_by_new_line(value).each do |line|
      next if description_line? line
      name_val = name_value_of line
    end
    name_val.strip
  end

  def name_value_of(line)
    if contains_type? line
      type_value = type_value_of line
      name_val = line.sub! type_value, ''
      name_val.sub! @name_type_separator, ''
    else
      line
    end
  end

  def description_value(model_attr, value)
    return value unless model_attr == :description
    description_val = ''
    split_by_new_line(value).each do |line|
      next unless description_line? line
      description_val += line.sub!(@comment_value, '')
    end
    description_val.strip
  end

  def type_value(model_attr, value)
    return value unless model_attr == :type
    type_value_of value
  end

  def type_value_of(value)
    type_val = ''
    split_by_new_line(value).each do |val|
      next unless contains_type? val
      spliced = split_by_name_type_separator val
      type_val += spliced.last
    end
    type_val.strip
  end

  def description_line?(line)
    line.start_with? @comment_value
  end

  def contains_type?(line)
    false if description_line? line
    line.include? @name_type_separator
  end

  def split_by_name_type_separator(value)
    value.split @name_type_separator
  end

  def split_by_new_line(value)
    value.split @new_line
  end
end