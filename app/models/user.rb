class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :plurks, :dependent => :destroy
  has_many :replies, :dependent => :destroy
  has_many :relationships
  has_many :followeds, through: :relationships
end
