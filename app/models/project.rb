class Project < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :tasks, :dependent => :destroy

  validates_presence_of :title
end
