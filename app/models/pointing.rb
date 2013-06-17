class Pointing < ActiveRecord::Base
  attr_accessible :name, :point
  
  def self.get_a_score(result)
    if result.result1 == result.match.final_result1 && result.result2 == result.match.final_result2
      self.ten 
    elsif (result.match.final_result1 > result.match.final_result2 && result.result1 > result.result2) || 
          (result.match.final_result2 > result.match.final_result1 && result.result2 > result.result1)
      self.five
    elsif result.match.final_result1 == result.result1 || result.match.final_result2 == result.result2
      self.three
    else
      self.zero
    end  
  end
  
  def self.zero
    self.where(:point => 0).first 
  end
  
  def self.three
    self.where(:point => 3).first 
  end
  
  def self.five
    self.where(:point => 5).first 
  end
  
  def self.ten
    self.where(:point => 10).first 
  end
  
end
