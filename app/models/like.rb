class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def self.update_like_counter(post, new_value)
    Like.find_by(post:).post.update(LikesCounter: new_value)
  end
end
