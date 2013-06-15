class Match < ActiveRecord::Base
  belongs_to :team1, :class_name => 'Team', :foreign_key => 'team1_id'
  belongs_to :team2, :class_name => 'Team', :foreign_key => 'team2_id'
  attr_accessible :date, :final_result1, :final_result2, :group, :locale
   
  def self.next_match_of_current_time
    self.where('date >= ?', DateTime.now).order(:date).first
  end
  
  def self.match_in_progress
    match = self.next_match_of_current_time
    
    if match.nil?
      return match
    end
    
    #DEBUG
    current_time = DateTime.now + 5.hours
    
    #RELEASE
    #current_time = DateTime.now
    
    #Se o horário for menor, quer dizer que o jogo já começou
    if match.date < current_time
      return match
    end
  end
  
end
