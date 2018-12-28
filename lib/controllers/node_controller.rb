require_relative 'a_controller'
require 'require_all'
require_all 'lib/context/model/nodes'
require_all 'lib/context/model/nodes/lists'
require_all 'lib/context/model/common'
require_relative '../context/config/a_config'
require_relative '../dynamo_repo'
require_relative '../helpers/class_helper'


class NodeController < AController

  def self.default_node_contexts
    map = {}
    name = 'Dynamo.Nodes.Function'
    map = add_function_context map, name
    name = 'Dynamo.Graph.Nodes.CustomNodes.Function'
    map = add_function_context map, name

    name = 'Dynamo.Graph.Nodes.CodeBlockNodeModel'
    map = add_code_block_context map, name
    name = 'Dynamo.Nodes.CodeBlockNodeModel'
    map = add_code_block_context map, name

    name = 'Dynamo.Graph.Nodes.ZeroTouch.DSFunction'
    map = add_zero_touch_context map, name
    name = 'Dynamo.Graph.Nodes.ZeroTouch.DSVarArgFunction'
    map = add_zero_touch_context map, name
    name = 'Dynamo.Nodes.DSFunction'
    map = add_zero_touch_context map, name

    name = 'PythonNodeModels.PythonNode'
    map = add_python_node_context map, name
    name = 'DSIronPythonNode.PythonNode'
    map = add_python_node_context map, name
    name = 'PythonNodeModels.PythonStringNode'
    map = add_python_node_context map, name

    name = 'Dynamo.Graph.Nodes.CustomNodes.Symbol'
    map = add_input_output_context map, name
    name = 'Dynamo.Nodes.Symbol'
    map = add_input_output_context map, name

    name = 'Dynamo.Graph.Nodes.CustomNodes.Output'
    map = add_input_output_context map, name
    name = 'Dynamo.Nodes.Output'
    map = add_input_output_context map, name

    map = AConfig.add_to map, CoreNodeModelContext.new
    # map = AConfig.add_to map, FormulaContext.new

    name = 'CoreNodeModels.Input'
    exclude = %w[FileObject DirectoryObject]
    map = add_dynamo_input_context map, name, exclude
    name = 'DSCoreNodesUI'
    exclude = %w[CreateList Formula StringNodes FromObject If]
    map = add_dynamo_input_context map, name, exclude
    name = 'Dynamo.Nodes'
    exclude = %w[Symbol Output DSFunction Function Watch]
    map = add_dynamo_input_context map, name, exclude

    name = 'DSRevitNodesUI.Categories'
    map = add_drop_down_context map, name
    name = 'DSRevitNodesUI.ElementTypes'
    map = add_drop_down_context map, name

    name = 'DSCore.Combine'
    map = add_multi_node_context map, name
    name = 'CoreNodeModels.CreateList'
    map = add_multi_node_context map, name
    name = 'Dynamo.Nodes.DSVarArgFunction'
    map = add_multi_node_context map, name
    name = 'DSCoreNodesUI.CreateList'
    map = add_multi_node_context map, name

    name = 'UnitsUI.UnitTypes'
    map = add_node_context map, name
    name = 'UnitsUI.UnitTypes'
    map = add_node_context map, name
    name = 'DSRevitNodesUI.ElementsOfCategory'
    map = add_node_context map, name
    name = 'DSRevitNodesUI.ElementsOfType'
    map = add_node_context map, name
    name = 'DSRevitNodesUI.ElementsAtLevel'
    map = add_node_context map, name
    name = 'DSCoreNodesUI.StringNodes.FromObject'
    map = add_node_context map, name
    name = 'DSCoreNodesUI.Logic.If'
    map = add_node_context map, name
    name = 'DSCore.Replace'
    map = add_node_context map, name
    name = 'DSCore.Replace'
    map = add_node_context map, name
    name = 'DSCore.Map'
    map = add_node_context map, name
    name = 'DSCore.Filter'
    map = add_node_context map, name
    name = 'DSCore.File.DirectoryObject'
    map = add_node_context map, name
    name = 'CoreNodeModels.Input.DirectoryObject'
    map = add_node_context map, name
    name = 'CoreNodeModels.Input.FileObject'
    map = add_node_context map, name
    name = 'CoreNodeModels.FromObject'
    map = add_node_context map, name
    name = 'CoreNodeModels.Watch'
    map = add_node_context map, name
    name = 'Dynamo.Nodes.Watch'
    map = add_node_context map, name
    map
  end

  def self.add_function_context(map, name)
    xml_type = FunctionNodeContext.create(name)
    AConfig.add_to map, xml_type
  end

  def self.add_zero_touch_context(map, name)
    xml_type = ZeroTouchContext.create(name)
    AConfig.add_to map, xml_type
  end

  def self.add_python_node_context(map, name)
    xml_type = PythonNodeContext.create(name)
    AConfig.add_to map, xml_type
  end

  def self.add_input_output_context(map, name)
    xml_type = CustomInOutContext.create(name)
    AConfig.add_to map, xml_type
  end

  def self.add_dynamo_input_context(map, name, exclude)
    xml_type = DynamoInputContext.create(name, exclude)
    AConfig.add_to map, xml_type
  end

  def self.add_code_block_context(map, name)
    xml_type = CodeBlockContext.create(name)
    AConfig.add_to map, xml_type
  end

  def self.add_drop_down_context(map, name)
    xml_type = DropDownNodeContext.create(name)
    AConfig.add_to map, xml_type
  end

  def self.add_multi_node_context(map, name)
    xml_type = MultiInputNodeContext.create(name)
    AConfig.add_to map, xml_type
  end

  def self.add_node_context(map, name)
    xml_type = NodeContext.create(name)
    AConfig.add_to map, xml_type
  end

  def initialize(parent = 'Elements',
                 context = NodeController.default_node_contexts)
    super parent, context
  end

  def managed?(xml_ele)
    managed = super xml_ele
    # if managed == false && dynamo_input?(xml_ele)
    #   prefix = input_type xml_ele
    #   super_class = DynamoNodeInput.class
    #   class_name = ClassHelper.class_name(prefix, super_class)
    #   new_class = ClassHelper.create(super_class, class_name)
    #   @pairs[new_class.to_sym] = XmlHelper.xml_symbol xml_ele
    # end
    managed
  end

end
