class Role 
  attr_accessor :name

  def initialize(name)
    @name = name.to_sym
  end

  # I18n lookup in role.<role name>
  def human_name
    I18n.t(@name, :scope => [:role], :default => @name.to_s.humanize)
  end

  def to_s
    @name.to_s
  end
  
  # For form builders
  def to_label
    human_name
  end

 # def ==(other)
 #   if other.is_a? self.class
 #     @name == other.name
 #   else
 #     @name == other.to_sym if other.respond_to? :to_sym
 #   end
 # end
end
