class User < ActiveRecord::Base
  ROLES = %w(normal manager admin)
  ROLES_INSTANCES = ROLES.map { |role| Role.new(role) }

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable, :trackable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :full_name, :info, :role
  
  before_validation :assign_default_role

  validates :role, :presence => true, :inclusion => {:in => ROLES}

  def role_instance
    Role.new(role) if role
  end

  def normal?
    role == 'normal'
  end
  
  def manager?
    role == 'manager'
  end

  def admin?
    role == 'admin'
  end

  def to_s
    full_name or email
  end

  def email_to
    if full_name
      "#{full_name} <#{email}>".strip
    else
      email
    end
  end

  protected
    def assign_default_role
      self.role ||= ROLES.first
    end
end
