class ResultsController < ApplicationController

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
        
    @all_matches = Match.where(date: DateTime.now.beginning_of_day..DateTime.now.end_of_day)
    
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
