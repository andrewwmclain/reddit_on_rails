class VotesController < ApplicationController
    def create
        @vote = Vote.where(:link_id => params[:vote][:link_id], :user_id => current_user.id).first
        if @vote
            @vote.up = params[:vote][:up]
            @vote.save
        else
            @vote = current_user.votes.create(vote_params)
        end
        redirect_to pages_path
    end

    def vote_params
        params.require(:vote).permit(:user_id, :link_id, :up)
    end
end