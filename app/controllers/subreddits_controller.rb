class SubredditsController < ApplicationController
    def index
        @subreddits = Subreddit.all
    end

    def show
        @subreddit = Subreddit.find(params[:id])
        @links = @subreddit.links.order('created_at ASC').paginate(:page => params[:page], :per_page => 10)
    end
end
