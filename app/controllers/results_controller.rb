class ResultsController < ApplicationController

  respond_to :html, :json

  def index
    
    @results = Result.all
    respond_with @results
  end

  def show
    @result = Result.find(params[:id])
    respond_with @results
  end

  def new
    @result = Result.new
    respond_with @results
  end

  def edit
    @result = Result.find(params[:id])
  end

  def create
    @result = Result.new(params[:result])

    if @result.save
      flash[:notice] = "Debug Create"
    end
    respond_with @results
  end

  def update
    @result = Result.find(params[:id])

    if @result.update_attributes(params[:result])
      flash[:notice] = "Debug Update"    
    end
    respond_with @results
  end

  def destroy
    @result = Result.find(params[:id])
    @result.destroy
    flash[:notice] = "Debug Destroy"
    respond_with @results
  end
end
