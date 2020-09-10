class SubredditsController < ApplicationController
    def index
        # @subreddits = Subreddit.all
        @subreddits = Subreddit.order('name ASC').paginate(:page => params[:page], :per_page => 10)
    end

    def show
        @subreddit = Subreddit.find(params[:id])
        @links = @subreddit.links.order('created_at ASC').paginate(:page => params[:page], :per_page => 10)
    end

    def new
        if current_user
            @subreddit = Subreddit.new
        else
            flash.notice = "You must signed in to do that!"
            redirect_back(fallback_location: subreddits_path) and return
        end
    end

    def create
        # @user = current_user
        @subreddit = Subreddit.new(subreddit_params)
        # @subreddit.user_id = @user.id
        # byebug
        if @subreddit.save
            flash.notice = "Subreddit '#{@subreddit.name}' Created!"
            redirect_to @subreddit and return
        else 
            render :new and return
        end
    end

    def subreddit_params
        params.require(:subreddit).permit(:name)
    end
end
