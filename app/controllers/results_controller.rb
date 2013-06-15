# encoding: UTF-8

class ResultsController < ApplicationController

  before_filter :require_authentication,
    :only => [:index, :new, :create, :destroy, :update]

  def index

    #Busca a primeira da data do jogo mais recente a partir da data atual 
    match = Match.next_match_of_current_time
    
    #A partir da data mais próxima, busca os jogos a partir dessa data e horário
    matche_id_of_day = Match.where('date >= ? AND date <= ?', match.date, match.date.end_of_day).order(:date).select(:id).collect(&:id)
    
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
    @match = Match.find(@result.match_id)
    respond_to do |format|
      if @match.date < DateTime.now
        format.json { render :json => { :result => "failed", 
                                        :message=>"Já não há tempo para mais nada amigo!", 
                                        :result_id => -1 } }
      end
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
