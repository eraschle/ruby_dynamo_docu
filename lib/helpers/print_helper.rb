require 'pp'
require 'ap'

class PrintHelper

  def self.pretty(object, ancestor = false)
    if ancestor
      mine = ClassHelper.ancestors_gem(object)
      mine.each do |m|
        pretty_obj m
      end
    else
      pretty_obj object
    end
  end

  def self.awesome(object, ancestor = false)
    if ancestor
      mine = ClassHelper.ancestors_gem(object)
      mine.each do |m|
        awesome_obj m
      end
    else
      awesome_obj object
    end
  end

  def self.pretty_obj(object)
    pp object
  end

  def self.awesome_obj(object)
    ap object
  end

end