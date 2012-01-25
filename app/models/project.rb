class Project < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :tasks, :dependent => :destroy
  has_many :permissions, :as => :thing

  validates :title, :presence => true, :uniqueness => true


  scope :readable_by, lambda { |user|
    joins(:permissions).where(:permissions => { :action => "view",
                                                :user_id => user.id })
  }

  def self.for(user)
    user.admin? ? Project : Project.readable_by(user)
  end


end
