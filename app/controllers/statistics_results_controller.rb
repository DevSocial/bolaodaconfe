# encoding: UTF-8

class StatisticsResultsController < ApplicationController

  before_filter :require_authentication,
    :only => [:index]

  def index
    
    @statistics_results = {}
    
    #Busca todos os usuários
    user_all = User.all
    
    #Busca todos os jogos do dia
    day_of_match = Match.where('date >= ?', DateTime.now).order(:date).select(:date).first
    matches_of_day = Match.where('date >= ? AND date <= ?', day_of_match.date, day_of_match.date.end_of_day).order(:date)
    
    matches_of_day.each do |match|
    
      #Popula o hash com a selação e o total de palpites   
      @statistics_results = { match.team1.name => 0, match.team2.name => 0 } 
      
      user_all.each do |user|
      
        #Existirá apenas um palpite do usuário a cada partida, por isso o first
        result = Result.where('user_id = ? AND match_id = ?', user.id, match.id).first
        
        unless (result.nil?)
          unless (result.result1.nil? && result.result2.nil?)
            if (result.result1 > result.result2)
              @statistics_results[match.team1.name] += 1
            elsif (result.result1 < result.result2)
              @statistics_results[match.team2.name] += 1 
            end
          end
        end
      end
    end
     
  end

end
