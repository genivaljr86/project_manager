class Asset < ActiveRecord::Base
  belongs_to :task, :dependent => :destroy 

  has_attached_file :asset, :path => (Rails.root + "files/:id").to_s,
  :url => "/files/:id".to_s
end
