class Plurk < ActiveRecord::Base
  has_many :replies, :dependent => :destroy
  validates_presence_of :user_id
  validates_presence_of :content
end
