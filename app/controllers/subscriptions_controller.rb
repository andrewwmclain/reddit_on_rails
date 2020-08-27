class SubscriptionsController < ApplicationController
    def create
        # if current_user
        #     @user = current_user
        #     byebug
        #     Subreddit.find(subreddit_params).users.create(@user)
        #     redirect_back(fallback_location: links_path) and return
        # else
        #     flash.notice = "You must signed in to do that!"
        #     redirect_back(fallback_location: links_path) and return
        # end
    end

    def new

    end

    # def subreddit_params
    #     params.require(:subreddit).permit(:id)
    # end
end
