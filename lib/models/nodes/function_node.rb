require_relative '../nodes/node'

class FunctionNode < Node
  attr_accessor :function_id, :function_name, :description, :inputs, :outputs
end
