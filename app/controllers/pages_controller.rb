class PagesController < ApplicationController
    def index
        @links = Link.order('created_at DESC').paginate(:page => params[:page], :per_page => 10)
    end
end
