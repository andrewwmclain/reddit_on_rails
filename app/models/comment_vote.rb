class CommentVote < ApplicationRecord
    validates :user_id, :uniqueness => { :scope => :comment_id }

    belongs_to :user
    belongs_to :comment
end
