class Task < ActiveRecord::Base
  belongs_to :project
  validates :title, :status, presence: true
end