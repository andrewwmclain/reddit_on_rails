class Comment < ApplicationRecord
    validates :user_id, presence: true

    belongs_to :parent, :class_name => 'Comment'
    has_many :children, :class_name => 'Comment', :foreign_key => 'parent_id'

    belongs_to :user
    belongs_to :link
    has_many :comment_votes
end
