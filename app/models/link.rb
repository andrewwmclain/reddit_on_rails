class Link < ApplicationRecord
    mount_uploader :avatar, AvatarUploader

    belongs_to :user
    belongs_to :subreddit, optional: true

    has_many :comments
    has_many :votes
end
