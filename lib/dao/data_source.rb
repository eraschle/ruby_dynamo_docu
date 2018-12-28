# frozen_string_literal: true

require 'REXML/document'
require 'REXML/elements'

# Represents the connection to the data source
class DataSource
  def connect(uri)
    file = File.new(uri)
    @document = REXML::Document.new file
  end

  def source_element?(source)
    !source.nil? && source.class == REXML::Element
  end

  def root
    raise 'no open source found' if @document.nil?

    @document.root
  end
end
