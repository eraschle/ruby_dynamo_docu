require_relative 'a_controller'
require_relative '../context/config/a_config'
require_relative '../context/model/common/import_context'

class ImportController < AController

  def self.default_import_contexts
    AConfig.add_to({}, ImportContext.new)
  end

  def initialize(parent = 'NamespaceResolutionMap',
                 context = ImportController.default_import_contexts)
    super parent, context
  end

end
