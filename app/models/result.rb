class Result < ActiveRecord::Base
  belongs_to :match
  attr_accessible :result1, :result2, :match_id

  validates :result1, :presence => true
  validates :result1, :numericality => true
  validates :result2, :presence => true
  validates :result2, :numericality => true
end
