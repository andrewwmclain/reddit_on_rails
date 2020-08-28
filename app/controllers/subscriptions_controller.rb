class SubscriptionsController < ApplicationController
    def create
        if current_user
            @user = current_user
            
            if(@user.subreddits.where(id: params[:subreddit][:id]).count > 0)
                flash.notice = "You are already subscribed to this subreddit!"
            else
                @user.subreddits << Subreddit.find(params[:subreddit][:id])
            end
            # Subreddit.find(params[:subreddit][:id]).users.create(email: current_user.email, 
            #                                         username: current_user.username,
            #                                         created_at: current_user.created_at,
            #                                         updated_at: current_user.updated_at,
            #                                         encrypted_password: current_user.encrypted_password,
            #                                         reset_password_token: current_user.reset_password_token,
            #                                         reset_password_sent_at: current_user.reset_password_sent_at,
            #                                         remember_created_at: current_user.remember_created_at,
            #                                         img_url: current_user.img_url,
            #                                         avatar: current_user.avatar)
            redirect_back(fallback_location: links_path) and return
        else
            flash.notice = "You must signed in to do that!"
            redirect_back(fallback_location: links_path) and return
        end
    end

    def new

    end

    def destroy
        @user = current_user
        @subreddit = @user.subreddits.find(params[:subreddit_id])
        @user.subreddits.delete(@subreddit)
        flash.notice = "Unsubscribed!"
        redirect_back(fallback_location: links_path) and return
    end

    def subreddit_params
        params.require(:subreddit).permit(:id, :created_at, :updated_at, :name)
    end
end

