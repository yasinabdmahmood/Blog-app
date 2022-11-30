class User < ApplicationRecord
  has_many :likes
  has_many :comments
  has_many :posts

  def retrieve_recent_posts
    posts.order(:created_at).limit(3)
  end
end
