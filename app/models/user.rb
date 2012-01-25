class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name

  validates_presence_of :first_name, :last_name
  has_many :tasks
  has_many :permissions

  def to_s
    "#{email} (#{admin? ? "Admin" : "User"})"
  end

  before_save :cleanup

  def name
    "#{first_name} #{last_name}"
  end

  def member_since
    created_at.strftime("%b %e, %Y")
  end

  private

  def cleanup
    self[:first_name] = self[:first_name].capitalize
    self[:last_name] = self[:last_name].capitalize
  end
end
