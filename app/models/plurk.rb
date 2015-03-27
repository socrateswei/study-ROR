class Plurk < ActiveRecord::Base
  has_many :replies, :dependent => :destroy
  belongs_to :user
  validates_presence_of :user_id
  validates_presence_of :content
end
