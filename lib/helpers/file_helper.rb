require 'rexml/document'
# Some Documentation
class FileHelper

  def self.filename(path)
    File.basename path
  end

  def self.files_of(directory, extension)
    Dir.chdir directory
    Dir.glob "**/*.#{extension}"
  end

  def self.open_xml(file_path)
    file = File.new(file_path)
    REXML::Document.new file
  end

end
