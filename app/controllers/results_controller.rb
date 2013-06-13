# encoding: UTF-8

class ResultsController < ApplicationController

  before_filter :require_authentication,
    :only => [:index, :new, :create, :destroy, :update]

  respond_to :html, :json

  def index
    # antes de fazer a pesquisa, é necessário verificar
    # se o usuário já deu um palpite, nesse caso
    # ele só quer editar o palpite
    
    #@result = Result.new
    #@result.match = Match.where('final_result1 IS NULL AND final_result2 IS NULL AND date >= ?', DateTime.now).first
    
    # falta atribuir o usuário,
    # algo parecido com o que há abaixo:
    # @result.user = current_user
    
    #respond_with @result    
        
    
    
    #@all_matches = Match.where('final_result1 IS NULL AND final_result2 IS NULL AND date >= ?', DateTime.now)
    
    #@result = Result.where(:user => current_user).first
    
    #@all_matches = Match.where
    
    #@all_matches = Match.where(date: (DateTime.now.to_date + 3.days + 13.hours)..(DateTime.now + 4.days))
    
    # Procura os jogos disponíveis para o palpite
    #next_match
    
    #@all_matches = Match.where('date >= ?', DateTime.now)
    
    #Data do jogo do Brasil dia 15 as 16: 
    #DateTime.now.to_date + 3.days + 13.hours
    
    #Data do jogo do México dia 16 as 16:
    #DateTime.now.to_date + 3.days + 14.hours
    
    #DEBUG
    
    #day_of_match = Match.where('date >= ?', DateTime.now).order(:date).select(:date).first
    #@all_matches = Match.where('date >= ? AND date <= ?', day_of_match.date, day_of_match.date.end_of_day)
    
    #DEBUG
    
    #Busca a primeira da data do jogo mais recente a partir da data atual 
    day_of_match = Match.where('date >= ?', DateTime.now).order(:date).select(:date).first
    
    #A partir da data mais próxima, busca os jogos a partir dessa data e horário
    all_matches_of_day = Match.where('date >= ? AND date <= ?', day_of_match.date, day_of_match.date.end_of_day)
    
    #Verifica se o usuário já palpitou em um dos jogos
    results = Result.where(:user_id => current_user.id)
            
        
    
    #@all_matches = Match.all
     
    #@all_matches = Match.where(date: (DateTime.now)..(DateTime.now + 1.days))
     
    #@results = Result.where('user_id = ? AND match_id IS NULL', current_user)
    
    
  end
  
  def create
    @result = Result.create(params[:result])
    @match = Match.find(@result.match_id)

    respond_to do |format|
      if @match.date < DateTime.now
        format.json { render :json => { :result => "failed", 
                                        :message=>"Já não há tempo para mais nada amigo!", 
                                        :result_id => -1 } }
      end
      if @result.save
        #flash[:success] = 'Deu certo!'
        format.json { render :json =>{ :result => "ok", :message=>"Feitoooo", :result_id => @result.id } }
      else
        format.json { render :json => { :result => "failed", :message=>"failed", :result_id => -1 } }
      end
    end

    #@result.save
    #render 'show'
    #if @result.save
    #  flash[:notice] = 'Palpite salvo com sucesso.'
    #else
    #  flash[:notice] = @result.errors.any? ? 'Teste Git' : 'nenhum'
    #end

    #redirect_to :action => :index
    #respond_with(@result)
  end

  def destroy
    Result.delete(params[:id])

    redirect_to :action => :index
  end
  
  def update
  end
end
