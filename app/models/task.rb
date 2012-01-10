class Task < ActiveRecord::Base
  belongs_to :project
  belongs_to :user


  validates_presence_of :title, :description

  def self.search(search)
    search_condition = "%" + search + "%"
    find(:all, :conditions => ['title LIKE ? OR description LIKE ?', search_condition, search_condition])
  end
end
