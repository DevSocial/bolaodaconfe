# encoding: UTF-8

class RulesController < ApplicationController

  def index
    @rules = Pointing.all
  end
  
end
