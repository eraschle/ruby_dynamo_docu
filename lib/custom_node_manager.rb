require_relative 'controllers/import_controller'
require_relative 'controllers/node_controller'
require_relative 'custom_python_node'

class CustomNodeManager

  attr_reader :import_control, :nodes_control

  def initialize(import = ImportController.new,
                 node = NodeController.new,
                 repository = DynamoRepo.new)
    @source_repo = repository
    @import_control = import
    @import_control.repository = @source_repo
    @nodes_control = node
    @nodes_control.repository = @source_repo
    @builder = Builder.new @source_repo
  end

  def import(file_path)
    @source_repo.open_file file_path
    node_name = FileHelper.filename(file_path)
    node = CustomPythonNode.new node_name, file_path
    node.imports = create_imports(@import_control)
    node.nodes = create_nodes(@nodes_control)
    node
  end

  def not_managed_sources
    @nodes_control.not_managed.merge(@import_control.not_managed)
  end

  private

  def create_imports(controller)
    source_parent = @source_repo.element_by_name(controller.parent)
    @source_repo.children(source_parent, controller).collect do |ele|
      @builder.build ele, controller
    end
  end

  def create_nodes(controller)
    parent = @source_repo.element_by_name(controller.parent)
    @source_repo.children(parent, controller).collect do |ele|
      @builder.build ele, controller
    end
  end

end
