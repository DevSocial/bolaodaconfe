class MatchesController < ApplicationController

  def index
    @group_a = Match.where(:group => 'A')
    @group_b = Match.where(:group => 'B')
  end
  
end
