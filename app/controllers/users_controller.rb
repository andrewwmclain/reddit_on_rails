class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @commentCount = @user.comments.count
        @postCount = @user.links.count
        @links = @user.links.paginate(:page => params[:page], :per_page => 10)
    end
end
