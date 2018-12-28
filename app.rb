# frozen_string_literal: true

require_relative 'lib/documentation'
require_relative 'lib/helpers/print_helper'
require_relative 'lib/models/nodes/node'

# import script
# lib_servie = ScriptService.new('dyn')
# path = 'C:/Dev/workspace/Dynamo/scripts/AWH_Familien/Uebersetzung/AmWaFamiliesTranslation_.dyn'
# script = lib_servie.import_file(path)

# import node
# C:/Dev/workspace/Dynamo/Libraries/Revit2017/packages/AmWa/dyf

documentation = Documentation::Dynamo.new
# path = 'C:/Dev/workspace/Dynamo/Libraries/Revit2017/packages/AmWa/dyf/DocumentFamilySymbolSearchReplace.dyf'
# node = documentation.custom_nodes.import_file(path)
path = 'C:/Dev/workspace/Dynamo/Libraries/Revit2017/packages'
nodes = documentation.import_dir(path)
file_count = 0
nodes.each do |custom_node|
  file_count += 1
  node_count = 0
  custom_node.nodes.each do |node|
    node_count += 1
    puts "#{file_count} > #{node_count}/#{custom_node.nodes.count} >> #{node.title} [#{node.uid}]"
  end
end
# puts 'Not Managed Node Sources'
# not_managed = documentation.custom_nodes.manager.not_managed_sources
# not_managed.each_key do |key|
#   PrintHelper.awesome ">> #{key} <<"
#   PrintHelper.awesome ">> #{not_managed[key]}"
# end
# puts 'Errors'
# PrintHelper.awesome documentation.custom_nodes.errors
