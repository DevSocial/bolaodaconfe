class Match < ActiveRecord::Base
  belongs_to :team1, :class_name => 'Team', :foreign_key => 'team1_id'
  belongs_to :team2, :class_name => 'Team', :foreign_key => 'team2_id'
  attr_accessible :date, :final_result1, :final_result2, :group, :locale, :team1_id, :team2_id
   
  def self.next_match_of_current_time
    self.where('date >= ?', Time.zone.now).order(:date).first
  end
  
  #CORRRIR: 
  #Náo será possível usar o next_match_of_current_time, pois ele sempre irá buscar
  #o jogo futuro, e a comparação de data nunca será true
  #Elaborar outra forma de buscar o jogo em progresso
  
  def self.match_in_progress
    match = self.next_match_of_current_time
    
    if match.nil?
      return match
    end
    
    #DEBUG
    #current_time = Time.zone.now + 5.hours
    
    #RELEASE
    current_time = Time.zone.now
    
    #Se o horário for menor, quer dizer que o jogo já começou
    if match.date < current_time
      return match
    end
  end
  
end
