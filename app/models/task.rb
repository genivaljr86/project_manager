class Task < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  has_many :comments

  has_many :assets, :dependent => :destroy
  accepts_nested_attributes_for :assets

  has_and_belongs_to_many :watchers, :join_table => "task_watchers", :class_name => "User"

  after_create :creator_watches_me
  validates_presence_of :title, :description

  def self.search(search)
    search_condition = "%" + search + "%"
    find(:all, :conditions => ['title LIKE ? OR description LIKE ?', search_condition, search_condition])
  end

  private

  def creator_watches_me
    self.watchers << user
  end
end
