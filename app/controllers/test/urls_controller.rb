class Test::UrlsController < ApplicationController
    # Using instance vars, although I think unnecessary bc no corresponding
    # views for this b/c these are j/ test actions. 
    # Don't have to return json from all these (I think?) bc
    # should be default return format.

    def index
        @urls = Url.all
    end

    def create
        @url = Url.create(
            short: params[:short]
            original: params[:original]
        )
    end

    def destroy
        @url = Url.find(params[:short])
        @url.destroy
    end

end
