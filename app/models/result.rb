class Result < ActiveRecord::Base
  belongs_to :match
  attr_accessible :result1, :result2, :match_id

  validates :result1, :result2, :presence => true, :numericality => true
end
