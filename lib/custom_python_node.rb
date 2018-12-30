# frozen_string_literal: true

class CustomPythonNode
  attr_accessor :name, :file_path, :namespaces, :nodes

  def initialize(name, path)
    @name = name
    @file_path = path
  end
end
