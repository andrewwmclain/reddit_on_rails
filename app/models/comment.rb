class Comment < ApplicationRecord
    validates :user_id, presence: true

    belongs_to :user
    belongs_to :link
    has_many :comment_votes
end
