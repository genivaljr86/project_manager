class Project < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :tasks, :dependent => :destroy

  validates :title, :presence => true, :uniqueness => true

end
