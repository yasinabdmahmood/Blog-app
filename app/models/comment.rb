class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def self.update_comment_counter(post, new_value)
    Comment.find_by(post:).post.update(CommnetsCounter: new_value)
  end
end
