class Reply < ActiveRecord::Base
  belongs_to :plurk
  belongs_to :user
  validates_presence_of :user_id
  validates_presence_of :plurk_id
  validates_presence_of :content
end
