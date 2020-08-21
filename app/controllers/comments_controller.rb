class CommentsController < ApplicationController    
    def create
        @comment = Comment.new(comment_params)
        respond_to do |format|
            format.html{
                if @comment.save
                    flash.notice = "Comment Submitted!"
                    redirect_to link_path(@comment.link_id)
                else 
                    flash.notice = "Comment could not be created."
                    redirect_to link_path(@comment.link_id)
                end
            }
            format.js{
                if @comment.save
                    flash.notice = "Comment Submitted!"
                    render 'create', layout: false, content_type: 'text/javascript' and return
                else 
                    flash.notice = "Comment could not be created."
                end            
            }
        end
    end

    def comment_params
        params.require(:comment).permit(:message, :user_id, :link_id)
    end
end
