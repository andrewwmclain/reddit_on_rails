class Link < ApplicationRecord
    attr_accessor :title, :id

    belongs_to :user
end
