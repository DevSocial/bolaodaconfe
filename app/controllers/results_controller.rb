class ResultsController < ApplicationController

  respond_to :html, :json

  def index
    # antes de fazer a pesquisa, é necessário verificar
    # se o usuário já deu um palpite, nesse caso
    # ele só quer editar o palpite
    
    @result = Result.new
    @result.match = Match.where('final_result1 IS NULL AND final_result2 IS NULL AND date >= ?', DateTime.now).first
    
    # falta atribui o usuário
    # algo parecido com o que há abaixo:
    # @result.user = current_user
    
    @all_matches = Match.order(:date)

    respond_with @result
  end
  
  def create
    @result = Result.create(params[:result])
    @result.save
    render 'show'
  end

  def destroy
    Result.delete(params[:id])

    redirect_to :action => :index
  end
  
  def update
  end
end
