class Survey < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true
  
  belongs_to :user
  has_many :questions
end
