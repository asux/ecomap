class EcoProperty < ActiveRecord::Base
  belongs_to :sample
  belongs_to :eco_parameter

  validates :value, :presence => true
  validates :eco_parameter, :uniqueness => {:scope => :sample}

  before_save :check_kind

  protected
  def check_kind
    if eco_parameter.kind != sample.kind
      error = I18n.t('acriverecord.errors.messages.eco_property.kind_mismatch', :default => "kind missmatch")
      self.errors[:sample] = error
      self.errors[:eco_parameter] = error
    end
  end
end
