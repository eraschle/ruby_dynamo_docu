# frozen_string_literal: true

require_relative 'context_factory'
require 'require_all'
require_all 'lib/factories'
require_all 'lib/context/model/nodes/lists'
require_all 'lib/context/model/common'

class ContextConfig
  def configure
    add_function_context
  end

  private

  def add_function_context
    name = 'Dynamo.Nodes.Function'
    add_context FunctionNodeContextBuilder.create name
    name = 'Dynamo.Graph.Nodes.CustomNodes.Function'
    add_context FunctionNodeContextBuilder.create name
    add_code_block_context
  end

  def add_code_block_context
    name = 'Dynamo.Graph.Nodes.CodeBlockNodeModel'
    add_context CodeBlockContextBuilder.create name
    name = 'Dynamo.Nodes.CodeBlockNodeModel'
    add_context CodeBlockContextBuilder.create name
    add_zero_touch_context
  end

  def add_zero_touch_context
    name = 'Dynamo.Graph.Nodes.ZeroTouch.DSFunction'
    add_context ZeroTouchContextBuilder.create name
    name = 'Dynamo.Graph.Nodes.ZeroTouch.DSVarArgFunction'
    add_context ZeroTouchContextBuilder.create name
    name = 'Dynamo.Nodes.DSFunction'
    add_context ZeroTouchContextBuilder.create name
    add_python_node_context
  end

  def add_python_node_context
    name = 'PythonNodeModels.PythonNode'
    add_context PythonNodeContextBuilder.create name
    name = 'DSIronPythonNode.PythonNode'
    add_context PythonNodeContextBuilder.create name
    name = 'PythonNodeModels.PythonStringNode'
    add_context PythonNodeContextBuilder.create name
    add_input_output_context
  end

  def add_input_output_context
    name = 'Dynamo.Graph.Nodes.CustomNodes.Symbol'
    add_context CustomInOutContextBuilder.create name
    name = 'Dynamo.Nodes.Symbol'
    add_context CustomInOutContextBuilder.create name

    name = 'Dynamo.Graph.Nodes.CustomNodes.Output'
    add_context CustomInOutContextBuilder.create name
    name = 'Dynamo.Nodes.Output'
    add_context CustomInOutContextBuilder.create name
    add_dynamo_input_context
  end

  def add_dynamo_input_context
    name = 'CoreNodeModels.Input'
    exclude = %w[FileObject DirectoryObject]
    add_context DynamoInputContextBuilder.create name, exclude
    name = 'DSCoreNodesUI'
    exclude = %w[CreateList Formula StringNodes FromObject If]
    add_context DynamoInputContextBuilder.create name, exclude
    name = 'Dynamo.Nodes'
    exclude = %w[Symbol Output DSFunction Function Watch]
    add_context DynamoInputContextBuilder.create name, exclude
    add_drop_down_context
  end

  def add_drop_down_context
    name = 'DSRevitNodesUI.Categories'
    add_context DropDownNodeContextBuilder.create name
    name = 'DSRevitNodesUI.ElementTypes'
    add_context DropDownNodeContextBuilder.create name
    add_multi_node_context
  end

  def add_multi_node_context
    name = 'DSCore.Combine'
    add_context MultiInputNodeContextBuilder.create name
    name = 'CoreNodeModels.CreateList'
    add_context MultiInputNodeContextBuilder.create name
    name = 'Dynamo.Nodes.DSVarArgFunction'
    add_context MultiInputNodeContextBuilder.create name
    name = 'DSCoreNodesUI.CreateList'
    add_context MultiInputNodeContextBuilder.create name
    add_revit_ui_context
  end

  def add_revit_ui_context
    name = 'DSRevitNodesUI.ElementsOfCategory'
    add_context NodeContextBuilder.create name
    name = 'DSRevitNodesUI.ElementsOfType'
    add_context NodeContextBuilder.create name
    name = 'DSRevitNodesUI.ElementsAtLevel'
    add_context NodeContextBuilder.create name
    name = 'DSCoreNodesUI.StringNodes.FromObject'
    add_context NodeContextBuilder.create name
    add_core_ui_context
  end

  def add_core_ui_context
    name = 'UnitsUI.UnitTypes'
    add_context NodeContextBuilder.create name
    name = 'UnitsUI.UnitTypes'
    add_context NodeContextBuilder.create name
    name = 'DSCoreNodesUI.Logic.If'
    add_context NodeContextBuilder.create name
    add_core_node_context
  end

  def add_core_node_context
    name = 'DSCore.Replace'
    add_context NodeContextBuilder.create name
    name = 'DSCore.Replace'
    add_context NodeContextBuilder.create name
    name = 'DSCore.Map'
    add_context NodeContextBuilder.create name
    name = 'DSCore.Filter'
    add_context NodeContextBuilder.create name
    name = 'DSCore.File.DirectoryObject'
    add_context NodeContextBuilder.create name
    add_node_model_context
  end

  def add_node_model_context
    name = 'CoreNodeModels.Input.DirectoryObject'
    add_context NodeContextBuilder.create name
    name = 'CoreNodeModels.Input.FileObject'
    add_context NodeContextBuilder.create name
    name = 'CoreNodeModels.FromObject'
    add_context NodeContextBuilder.create name
    name = 'CoreNodeModels.Watch'
    add_context NodeContextBuilder.create name
    name = 'Dynamo.Nodes.Watch'
    add_context NodeContextBuilder.create name
  end

  def add_context(context)
    ContextFactory.add context
  end
end
    # map = AConfig.add_to map, CoreNodeModelContext.new
    # # map = AConfig.add_to map, FormulaContext.new
