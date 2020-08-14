class RepliesController < ApplicationController
    def new
        @reply = Comment.new 
        @comment = Comment.find(params[:comment])
        @link = Link.find(params[:link])
    end

    def create
        @user = current_user
        @reply = Comment.new(reply_params)
        @reply.user_id = @user.id
        byebug
        if @reply.save
            flash.notice = "Reply Created!"
            redirect_to link_path(@reply.link_id) and return
        else 
            render :new and return
        end
    end

    def reply_params
        params.require(:comment).permit(:message, :user_id, :link_id, :parent_id)
    end
end
