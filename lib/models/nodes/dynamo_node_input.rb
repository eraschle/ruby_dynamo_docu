# frozen_string_literal: true

require_relative 'node'

class DynamoNodeInput < Node
  attr_accessor :input_value, :input_type
end
