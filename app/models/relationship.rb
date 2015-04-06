class Relationship < ActiveRecord::Base
  belongs_to :user
  belongs_to :followed, class_name: "User", foreign_key: :followed_id
  validates_presence_of :user_id
  validates_presence_of :followed_id
  validates :user_id, uniqueness: { scope: :followed_id, message: "You already followed this guy" }
end
