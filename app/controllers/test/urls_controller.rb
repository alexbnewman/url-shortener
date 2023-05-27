class Test::UrlsController < ApplicationController
    # Using instance vars, although I think unnecessary bc no corresponding
    # views for this b/c these are j/ test actions. 
    # Don't have to return json from all these (I think?) bc
    # should be default return format.

    # TODO: Or do I need to render JSON? So that the correct thing is returned?

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
