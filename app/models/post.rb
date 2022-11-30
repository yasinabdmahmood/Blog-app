class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments

  def self.update_post_counter(user, new_value)
    Post.find_by(user:).user.update(PostsCounter: new_value)
  end

  def retrieve_recent_comments
    comments.order(:created_at).limit(5)
  end
end
