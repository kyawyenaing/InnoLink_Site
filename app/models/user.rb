class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :token_authenticatable

  belongs_to :role
  has_many :jobs

  before_create :set_default_role

  def assign_role
    self.role = Role.find_by name: "Regular" if self.role.nil?
  end

  def admin?
    self.role.name == "Admin"
  end

  def owner?
    self.role.name == "Owner"
  end

  def regular?
    self.role.name == "Regular"
  end

private
  def set_default_role
    role = Role.find_by_name("Owner")
    self.role_id = role.id
  end
  
end
