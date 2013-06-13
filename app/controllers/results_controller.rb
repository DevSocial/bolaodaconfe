# encoding: UTF-8

class ResultsController < ApplicationController

  before_filter :require_authentication,
    :only => [:index, :new, :create, :destroy, :update]

#  respond_to :html, :json

  def index
    #Data do jogo do Brasil dia 15 as 16: 
    #DateTime.now.to_date + 3.days + 13.hours
    
    #Data do jogo do México dia 16 as 16:
    #DateTime.now.to_date + 3.days + 11.hours
    
    #DEBUG
    
    #day_of_match = Match.where('date >= ?', DateTime.now).order(:date).select(:date).first
    #@all_matches = Match.where('date >= ? AND date <= ?', day_of_match.date, day_of_match.date.end_of_day)
    
    #DEBUG
    
    #@date = DateTime.now
    
    #Busca a primeira da data do jogo mais recente a partir da data atual 
    day_of_match = Match.where('date >= ?', DateTime.now).order(:date).select(:date).first
    
    #A partir da data mais próxima, busca os jogos a partir dessa data e horário
    matche_id_of_day = Match.where('date >= ? AND date <= ?', day_of_match.date, day_of_match.date.end_of_day).order(:date).select(:id).collect(&:id)
    
    #Busca os match_id existentes no Result
    match_id_exists = Result.where('user_id = ? AND match_id IN (?)', current_user.id, matche_id_of_day).select(:match_id).collect(&:match_id)
    
    #Subtrai as duas coleções e obtém apenas a diferença        
    match_id_not_exists = matche_id_of_day - match_id_exists
    
    match_id_not_exists.each do |match|
      result = Result.create(:match_id => match, :user_id => current_user.id)
      result.save(:validate => false)
    end
    
    @results = Result.where('user_id = ? AND match_id IN (?)', current_user.id, matche_id_of_day)
    
  end
  
  def update
    @result = Result.find(params[:id])
    respond_to do |format|
      if @result.update_attributes(params[:result])
        format.json { render :json =>{ :result => "ok", :message => "Palpite salvo com sucesso!", :result_id => @result.id } }
      else
        format.json { render :json => { :result => "failed", :message => "Ops...não foi possível salvar seu palpite", :result_id => -1 } }
      end
    end 
  end

#  def destroy
#    Result.delete(params[:id])
#    redirect_to :action => :index
#  end
  
end
