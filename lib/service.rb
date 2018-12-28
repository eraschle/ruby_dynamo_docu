require_relative 'helpers/file_helper'
require_relative 'dynamo_repo'
require_relative 'custom_node_manager'
require_relative 'builder'

class Service

  attr_reader :manager, :errors

  def initialize(manager = CustomNodeManager.new)
    @manager = manager
    @errors = {}
  end

  def import_file(file_path)
    @manager.import(file_path)
  rescue StandardError => e
    @errors[file_path] = e.to_s
    raise
  end

  def import_dir(dir_path, extension = 'dyf')
    data = []
    files = FileHelper.files_of(dir_path, extension)
    files.each do |file|
      data = add_import_data data, file
    end
    data
  end

  def add_import_data(data, file_path)
    begin
      data << import_file(file_path)
    rescue StandardError => e
      @errors[file_path] = e.message
      raise e
    end
    data
  end
end
