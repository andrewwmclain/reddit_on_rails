class LinksController < ApplicationController
    def index
        @links = Link.order("created_at ASC").paginate(:page => params[:page], :per_page => 10)
    end

    def show
        @link    = Link.find(params[:id])
        @comment = Comment.new
    end

    def new
        if current_user
            @link = Link.new
        else
            flash.notice = "You must signed in to do that!"
            redirect_back(fallback_location: links_path) and return
        end
    end
    
    def create
        @user = current_user
        @link = Link.new(link_params)
        @link.user_id = @user.id
        byebug
        if @link.save
            flash.notice = "Link '#{@link.title}' Created!"
            redirect_to @link and return
        else 
            render :new and return
        end
    end

    def destroy
        Link.find(params[:id]).destroy
    end

    def link_params
        params.require(:link).permit(:title, :url, :body, :avatar, :subreddit_id)
    end
end