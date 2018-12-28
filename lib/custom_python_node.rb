
class CustomPythonNode
  attr_accessor :name, :file_path, :imports, :nodes

  def initialize(name, path)
    @name = name
    @file_path = path
  end
end
