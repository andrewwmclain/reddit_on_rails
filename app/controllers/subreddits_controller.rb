class SubredditsController < ApplicationController
    def index
        @subreddits = Subreddit.all
    end
end
