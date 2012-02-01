class CreateTaskWatchersTable < ActiveRecord::Migration
  def change
    create_table :task_watchers, :id => false do |t|
      t.integer :user_id, :task_id
    end
  end

end
