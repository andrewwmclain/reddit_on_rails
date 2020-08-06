class SearchController < ApplicationController
    def index
        @links = Link.basic_search(title: params[:q]).paginate(:page => params[:page], :per_page => 10)
    end
end
