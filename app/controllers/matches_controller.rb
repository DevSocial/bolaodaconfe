class MatchesController < ApplicationController

  def index
    @group_a = Match.where(:group => 'A').order(:date)
    @group_b = Match.where(:group => 'B').order(:date)
  end
  
end
