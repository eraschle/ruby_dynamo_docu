# represents a not mapped dynamo not node
class NotMapped
  def initialize(xml_type)
    @xml_type = xml_type
  end

  def method_missing(name, *args)
    super.method_missing name, &args
  rescue NoMethodError
    @xml_type
  end

  def respond_to_missing?(_name, *_args)
    true
  end
end
