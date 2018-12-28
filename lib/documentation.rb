require_relative 'documentation/version'
require_relative 'service'

module Documentation
  class Error < StandardError
  end
  # Your code goes here...

  class DynamoDocumentation
    attr_reader :custom_nodes

    def initialize
      init_node_service
    end

    private

    def init_node_service
      @custom_nodes = Service.new
    end
  end
end
