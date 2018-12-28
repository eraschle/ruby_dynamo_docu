# frozen_string_literal: true

require_relative '../nodes/lists/multi_input_node'

class PythonNode < MultiInputNode
  attr_accessor :code
end
