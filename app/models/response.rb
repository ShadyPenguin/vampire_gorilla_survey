class Response < ActiveRecord::Base
  belongs_to :choice
  has_one :question, through: :choice
end
