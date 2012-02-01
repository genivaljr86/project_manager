class Comment < ActiveRecord::Base
  belongs_to :task
  belongs_to :user
  after_create :creator_watches_task

  validates_presence_of :text

  private

  def creator_watches_task
    task.watchers << user
  end
end
