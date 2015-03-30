class Relationship < ActiveRecord::Base
  belongs_to :user
  belongs_to :followed, class_name: "User", foreign_key: :followed_id
end
