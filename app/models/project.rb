class Project < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :tasks, :dependent => :destroy
  has_many :permissions, :as => :thing
  belongs_to :customer

  validates :title, :presence => true, :uniqueness => true


  scope :readable_by, lambda { |user|
    joins(:permissions).where(:permissions => { :action => "view",
                                                :user_id => user.id })
  }

  def self.for(user)
    user.admin? ? Project : Project.readable_by(user)
  end

  def customer_name
    customer.try(:name)
  end

  def customer_name=(name)
    self.customer = Customer.find_or_create_by_name(name) if name.present?
  end


end
