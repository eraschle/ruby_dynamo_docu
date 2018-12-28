# frozen_string_literal: true

# Some Documentation
class FileHelper
  def self.files_of(directory, extension)
    Dir.chdir directory
    Dir.glob "**/*.#{extension}"
  end
end
