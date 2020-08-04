class LinksController < ApplicationController
    def index
    end

    def show
    end

    def new
        @link = Link.new
    end
    
    def create
        @link = Link.new(link_params)
        @link.save

        flash.notice = "Link '#{@link.title}' Created!"

        redirect_to @link
        
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