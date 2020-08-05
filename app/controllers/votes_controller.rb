class VotesController < ApplicationController
    def create
        # @vote = Vote.new(vote_params)

        # if @vote.save
        #     flash.notice = "Voted!"
        # else 
        #     flash.notice = "Cannot vote"
        # end
        # redirect_to pages_path

        @vote = Vote.where(:link_id => params[:vote][:link_id], :user_id => current_user.id).first
        if @vote
            @vote.up = params[:vote][:up]
            @vote.save
        else
            @vote = current_user.votes.create(params[:vote])
        end
        redirect_to pages_path
    end

    def vote_params
        params.require(:vote).permit(:user_id, :link_id, :up)
    end
end