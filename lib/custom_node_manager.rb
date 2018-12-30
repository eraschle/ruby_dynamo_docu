# frozen_string_literal: true

require_relative 'dao/data_source'
require_relative 'dao/dynamo_dao'
require_relative 'repository'
require_relative 'builders/model_builder'
require_relative 'custom_python_node'

# Manager to import custom nodes
class CustomNodeManager
  @namespace_name = 'NamespaceResolutionMap'
  @nodes_name = 'Elements'

  def initialize(data_source = DataSource.new)
    @data_source = data_source
    @dao = DynamoDao.new @data_source
    @repo = Repository.new @dao
    @builder = ModelBuilder.new @repo
  end

  def create(file_path)
    @data_source.connect file_path
    node = create_custom_node file_path
    node.namespaces = import @namespace_name
    node.nodes = import @nodes_name
    node
  end

  private

  def create_custom_node(file_path)
    node_name = File.basename file_path
    CustomPythonNode.new node_name, file_path
  end

  def import(child_name)
    imports = []
    root_child = @repo.root_child_by child_name
    @repo.children(root_child).each do |child|
      model = @builder.build child
      imports << model unless model.nil?
    end
    imports
  end
end
