class PagesController < ApplicationController
    def index
        @links = Link.order('created_at ASC').paginate(:page => params[:page], :per_page => 10)
    end
end
