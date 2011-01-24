class SampleKind
  attr_accessor :name

  def initialize(name)
    @name = name.to_sym
  end

  def to_s
    @name.to_s
  end

  def human_name
    I18n.t(@name, :scope => [:sample_kind], :default => @name.to_s)
  end

  def to_label
    human_name
  end

  def id
    to_s
  end
end