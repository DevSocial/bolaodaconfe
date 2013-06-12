class Result < ActiveRecord::Base
  belongs_to :match
  belongs_to :user
  attr_accessible :result1, :result2, :match_id, :user_id

  validates :result1, :result2, :presence => true, :numericality => true
end
