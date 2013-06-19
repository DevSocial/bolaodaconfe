# encoding: UTF-8

class HistoryMatchesController < ApplicationController

  before_filter :require_authentication, :only => [:index]

  def index
    @matches = Match.where('date < ?', Time.zone.now).order(:date)
  end

  def preview
    @results = Result.joins(:user).where('match_id = ? AND result1 IS NOT NULL AND result2 IS NOT NULL', 
                            params[:id]).order(:full_name)
    @match = Match.find(params[:id])
  end

end