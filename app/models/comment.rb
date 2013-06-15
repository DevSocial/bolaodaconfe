class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  attr_accessible :content, :user_id, :post_id
  
  def self.comments_of_post(post)
    self.where(:post_id => post.id)
  end
end
