class ResultsController < ApplicationController

  respond_to :html, :json

  def index
    # antes de fazer a pesquisa, é necessário verificar
    # se o usuário já deu um palpite, nesse caso
    # ele só quer editar o palpite
    
    next_match = Match.where('final_result1 IS NULL AND final_result2 IS NUll AND date >= ?', DateTime.now).first
    
    @result = Result.new
    @result.match = next_match
    
    # falta atribui o usuário
    # algo parecido com o que há abaixo:
    # @result.user = current_user
    
    respond_with @result
  end
  
  def create
    @result = Result.create(params[:result])
    @result.save
    respond_to @result
  end
  
  def update
  end
end
