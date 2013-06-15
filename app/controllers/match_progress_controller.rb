# encoding: UTF-8

class MatchProgressController < ApplicationController
  
  before_filter :require_authentication,
    :only => [:index]  
   
  def index
    @match = Match.match_in_progress

    #Garantir que exista um jogo em progresso
    if @match.nil?
      #Temporário, talvez o melhor seria mostrar uma mensagem ao usuário
      redirect_to matches_path
    end
    
    @results = Result.where('match_id = ? AND result1 IS NOT NULL AND result2 IS NOT NULL', @match.id)
  end
  
end
