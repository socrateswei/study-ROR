class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :follower, class_name: "User", foreign_key: :follower_id
  belongs_to :following, class_name: "User", foreign_key: :following_id
  validates_presence_of :follower_id
  validates_presence_of :following_id
  validates :follower_id, uniqueness: { scope: :following_id, message: "You already followed this guy" }
end
