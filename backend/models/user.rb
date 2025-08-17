class User < ActiveRecord::Base
  has_many :projects
  validates :email, presence: true, uniqueness: true
end
