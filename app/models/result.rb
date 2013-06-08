class Result < ActiveRecord::Base
  belongs_to :match
  attr_accessible :result1, :result2, :match_id
end
