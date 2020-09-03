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

    def destroy
        Comment.find(params[:id]).destroy
        redirect_back(fallback_location: links_path) and return
    end

    def edit
        @comment = Comment.find(params[:id])
    end
    
    def update
        @comment = Comment.find(params[:id])
        if @comment 
            byebug
            @comment.update_attributes(message: params[:comment][:message])
            byebug
        end
        redirect_to link_path(@comment.link_id)
    end

    def comment_params
        params.require(:comment).permit(:message, :user_id, :link_id)
    end
end
