class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :match
  has_many :comments
  
  attr_accessible :content, :match_id, :user_id
  
  def self.post_of_match(match)
    self.where(:match_id => match.id).first
  end
end
