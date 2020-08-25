class LinksController < ApplicationController
    def index
        @links = Link.order("created_at ASC").paginate(:page => params[:page], :per_page => 10)
    end

    def show
        @link    = Link.find(params[:id])
        @comment = Comment.new
    end

    def new
        @link = Link.new
    end
    
    def create
        @user = current_user
        @link = Link.new(link_params)
        @link.subreddit_id = 1
        @link.user_id = @user.id
        if @link.save
            flash.notice = "Link '#{@link.title}' Created!"
            redirect_to @link and return
        else 
            render :new and return
        end
    end

    def link_params
        params.require(:link).permit(:title, :url, :body, :avatar)
    end
end