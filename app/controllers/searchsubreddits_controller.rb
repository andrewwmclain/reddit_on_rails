class SearchsubredditsController < ApplicationController
    def index
        @subreddits = Subreddit.basic_search(name: params[:q]).paginate(:page => params[:page], :per_page => 10)
    end
end
