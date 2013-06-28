class MatchesController < ApplicationController

  before_filter :require_authentication,
    :only => [:index]

  def index
    @finais = Match.where(:group => 'FINAIS').order(:date)
    @semifinais = Match.where(:group => 'SEMIFINAIS').order(:date)
    @group_a = Match.where(:group => 'A').order(:date)
    @group_b = Match.where(:group => 'B').order(:date)
  end
  
end
