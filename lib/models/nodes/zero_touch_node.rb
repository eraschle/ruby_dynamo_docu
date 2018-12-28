# frozen_string_literal: true

require_relative 'node'

# Zero touch node representation
class ZeroTouchNode < Node
  attr_accessor :assembly, :function, :ports
end
