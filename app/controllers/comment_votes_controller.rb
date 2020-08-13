class CommentVotesController < ApplicationController
    def create
        @commentVote = CommentVote.where(:comment_id => params[:comment_vote][:comment_id], :user_id => current_user.id).first
        if @commentVote
            @commentVote.up = params[:comment_vote][:up]
            @commentVote.save
        else
            @commentVote = current_user.comment_votes.create(comment_vote_params)
        end
        redirect_to link_path(@commentVote.comment.link_id)
    end

    def comment_vote_params
        params.require(:comment_vote).permit(:user_id, :comment_id, :up)
    end

end
