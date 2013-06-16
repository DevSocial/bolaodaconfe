# encoding: UTF-8

class GeneralRankingController < ApplicationController

  before_filter :require_authentication,
    :only => [:index]
    
  def index
    #Ranking geral dos usuários
    @general_ranking = Array.new

    users = User.all
    users.each do |user|
      @general_ranking << { :user => user, :pointing => Pointing.zero }
    end

    #Obtém todos os palpites onde os jogos já foram encerrados
    results = Result.joins(:match).where('final_result1 IS NOT NULL AND final_result2 IS NOT NULL').includes(:match).order(:user_id)
    
    #Popula a pontução de cada usuário
    results.each do |result|
      @general_ranking.each do |gr|
        if gr[:user] == result.user
          #Validação: é possível que o usuário tenha acessado o Quero Palpitar,
          #porém ele não palpitou, dessa forma result1 e result2 estarão nulos
          unless result.result1.nil? && result.result2.nil?
            pointing = Pointing.new
            pointing.point = gr[:pointing].point + Pointing.get_a_score(result).point
            gr[:pointing] = pointing
          end
        end
      end
    end
    
    #Ordenar pelo maior pontuador
    #Observação: talvez seja necessário definir regra para desempate
    @general_ranking.sort! { |p1, p2| p1[:pointing].point <=> p2[:pointing].point }
    @general_ranking.reverse!
  end

end
