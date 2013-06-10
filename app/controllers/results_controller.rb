class ResultsController < ApplicationController

  respond_to :html, :json

  def index
    # antes de fazer a pesquisa, é necessário verificar
    # se o usuário já deu um palpite, nesse caso
    # ele só quer editar o palpite
    
    #@result = Result.new
    #@result.match = Match.where('final_result1 IS NULL AND final_result2 IS NULL AND date >= ?', DateTime.now).first
    
    # falta atribui o usuário
    # algo parecido com o que há abaixo:
    # @result.user = current_user
    
    #respond_with @result
        
    @all_matches = Match.order(:date)
    
  end
  
  def create
    @result = Result.create(params[:result])
    #@result.save
    #render 'show'
    if @result.save
      flash[:notice] = 'Palpite salvo com sucesso.'
    else
      flash[:notice] = @result.errors.any? ? 'frizzo' : 'nenhum'
    end

    redirect_to :action => :index
    #respond_with(@result)
  end

  def destroy
    Result.delete(params[:id])

    redirect_to :action => :index
  end
  
  def update
  end
end
