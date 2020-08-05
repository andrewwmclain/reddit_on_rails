class LinksController < ApplicationController
    def index
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
        @link.user_id = @user.id
        if @link.save
            flash.notice = "Link '#{@link.title}' Created!"
            redirect_to @link
        else 
            render :new
        end
        
        # @link = Link.new(link_params)
        # if @link.save
        #   redirect_to @link
        # else
        #   render :new
        # end

        # @link = Link.new(link_params)
        # respond_to do |format|
        #       if @link.save
        #         format.html { redirect_to @link, notice: 'Link was successfully created.' }
        #         format.json { render :show, status: :created, location: @link }
        #       else
        #         format.html { render :new }
        #         format.json { render json: @link.errors, status: :unprocessable_entity }
        #       end
        # end
    end

    def link_params
        params.require(:link).permit(:title, :url)
    end
end