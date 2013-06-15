# encoding: UTF-8

class StatisticsResultsController < ApplicationController

  before_filter :require_authentication,
    :only => [:index]

  def new
    @statistics_results = {}
    @count_results = 0
    
    #Busca todos os usuários
    user_all = User.all
    
    match = Match.find(params[:match])   
    
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
          @count_results += 1
        end
      end
    end
    
    count = @statistics_results.count
    
    #Deserializa objeto para o formato a qual o google chart interpreta
    @google_chart = ""
    @statistics_results.each do |sr|
      @google_chart = @google_chart + "['" + sr[0].to_s + "' , " + sr[1].to_s + "]"
      count -= 1
      unless (count == 0)
        @google_chart = @google_chart + ", "
      end
    end
    
    respond_to do |format|
        format.html { render @google_chart }
    end
  end

  def antigo_index    
    @statistics_results = {}
    @count_results = 0
    
    #Busca todos os usuários
    user_all = User.all
    
    #Busca todos os jogos do dia
    day_of_match = Match.where('date >= ?', Time.zone.now).order(:date).select(:date).first
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
            @count_results += 1
          end
        end
      end
    end
    
    count = @statistics_results.count
    
    #Deserializa objeto para o formato a qual o google chart interpreta
    @google_chart = ""
    @statistics_results.each do |sr|
      @google_chart = @google_chart + "['" + sr[0].to_s + "' , " + sr[1].to_s + "]"
      count -= 1
      unless (count == 0)
        @google_chart = @google_chart + ", "
      end
    end
  
  end

end
