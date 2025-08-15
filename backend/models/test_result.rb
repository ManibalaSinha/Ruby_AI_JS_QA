class TestResult < ActiveRecord::Base
  validates :url, :status, presence: true
end
