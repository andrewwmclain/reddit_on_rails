class CommentsController < ApplicationController    
    def create
        @comment = Comment.new(comment_params)

        if @comment.save
            flash.notice = "Comment Submitted!"
            redirect_to link_path(@comment.link_id)
        else 
            flash.notice = "Comment could not be created."
            render :new
        end
    end

    def comment_params
        params.require(:comment).permit(:message, :user_id, :link_id)
    end
end
