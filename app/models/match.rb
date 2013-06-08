class Match < ActiveRecord::Base
  belongs_to :team1, :class_name => 'Team', :foreign_key => 'team1_id'
  belongs_to :team2, :class_name => 'Team', :foreign_key => 'team2_id'
  attr_accessible :date, :final_result, :final_result1, :group, :locale
end
