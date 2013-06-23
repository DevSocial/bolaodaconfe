class MatchesController < ApplicationController

  before_filter :require_authentication,
    :only => [:index]

  def index
    @semifinais = Match.where(:group => 'SEMIFINAIS').order(:date)
    @group_a = Match.where(:group => 'A').order(:date)
    @group_b = Match.where(:group => 'B').order(:date)
  end
  
end
