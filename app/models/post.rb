class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  validates :Title, presence: true, length: { in: 1..250 }
  validates :CommnetsCounter, comparison: { greater_than_or_equal_to: 0 }, numericality: { only_integer: true }
  validates :LikesCounter, comparison: { greater_than_or_equal_to: 0 }, numericality: { only_integer: true }

  def self.update_post_counter(user, new_value)
    Post.find_by(user:).user.update(PostsCounter: new_value)
  end

  def retrieve_recent_comments
    comments.order(:created_at).limit(5)
  end
end
