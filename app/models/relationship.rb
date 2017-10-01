class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User" # looks for follower_id automatically
  belongs_to :followed, class_name: "User"
  validates :follower_id, presence: true
  validates :followed_id, presence: true
end
