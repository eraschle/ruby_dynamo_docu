require_relative '../node'
require_relative '../../../helpers/parse_helper'

class MultiInputNode < Node

  attr_reader :input_count

  def input_count=(count)
    @input_count = ParseHelper.string_to_int count
  end
end