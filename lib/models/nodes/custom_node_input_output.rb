# frozen_string_literal: true

require_relative 'node'

class CustomNodeInputOutput < Node
  attr_accessor :kind, :name, :description, :type
end
