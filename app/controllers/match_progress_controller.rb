# encoding: UTF-8

class MatchProgressController < ApplicationController
  
  before_filter :require_authentication,
    :only => [:index]  
   
  def index
    @match = Match.match_in_progress

    unless @match.nil?
      
    end
    
    @results = Result.where('match_id = ? AND result1 IS NOT NULL AND result2 IS NOT NULL', @match.id)
  end
  
end
