class Test::UrlsController < ApplicationController
    # Using instance vars, although I think unnecessary bc no corresponding
    # views for this b/c these are j/ test actions.
    # Do have to render smthg from all these so that we are not just routed
    # to (nonexisting) HTML view for each of these actions.

    # TODO: I don't actually know how safe this is... Maybe okay
    # cuz I'm only kind of using for CRUD Rest actions, but not sure.
    # Only specified actions - :create, :update, :destroy -- this is to be able
    # to access these routes with Postman so I can test things (gets around
    # issue of CSRF token -- token that verifies all requests are coming from
    # my own web app).
    skip_before_action :verify_authenticity_token, only: [:index, :create, :destroy, :destroy_range]

    def index
        @urls = Url.all
        render json: @urls
    end

    def create
        @url = Url.create(
            short: params[:short],
            original: params[:original]
        )
        render json: @url
    end

    def destroy
        @url = Url.find(params[:id])
        @url.destroy
        render json: Url.all
    end

    def destroy_range
        start = params[:start].to_i
        final = params[:final].to_i
        Url.where(id: start..final).destroy_all
        render json: Url.all
    end

end
