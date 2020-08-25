class Subreddit < ApplicationRecord
    has_many :links
    has_and_belongs_to_many :users
end
