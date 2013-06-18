# encoding: UTF-8

class HistoryMatchesController < ApplicationController

  before_filter :require_authentication, :only => [:index]

  def index
    @matches = Match.where('date < ?', Time.zone.now).order(:date)
  end

  def preview
    @results = Result.where('match_id = ?', params[:id])
    @match = Match.find(params[:id])
  end

end