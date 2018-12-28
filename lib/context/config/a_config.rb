class AConfig

  def self.build_prefix
    :build_symbol
  end

  def self.merge_prefix
    :merge_symbol
  end

  def self.create_build_symbol(suffix)
    "#{AConfig.build_prefix}_#{suffix}".to_sym
  end

  def self.create_merge_symbol(suffix)
    "#{AConfig.merge_prefix}_#{suffix}".to_sym
  end

  def self.add_to(map, context)
    map[context.source] = context
    map
  end

end