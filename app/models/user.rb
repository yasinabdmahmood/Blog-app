class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'
  
  validates :Name, presence: true
  validates :PostsCounter, comparison: { greater_than_or_equal_to: 0 }, numericality: { only_integer: true }
  

  def retrieve_recent_posts
    posts.order(:created_at).limit(3)
  end
end
