require './app/services/urlConverter.rb'
class UrlsController < ApplicationController

  # TODO: Add comments defining functions? What is this called again?

  # TODO: I don't actually know how safe this is... Maybe okay
  # cuz I'm only kind of using for testing actions, but not sure.
  # Also, this is to be able to access these routes with Postman 
  # so I can test things (gets around
  # issue of CSRF token -- token that verifies all requests are coming from
  # my own web app).
  skip_before_action :verify_authenticity_token, only: [:encode, :decode]

  def encode
    #@short_url = UrlConverter.new(params[:original]).encode
    @short_url = UrlConverter.encode(params[:original])
    @url = Url.new(url_params)
    # TODO: Do you only want to render JSON for testing? 
    if @url.save
      render json: { short_url: url_for(@url.short) }, status: :created
    else
      render json: { error: 'Failed to create short URL' }, status: :unprocessable_entity
    end
  end

  def decode
    @url = Url.find_by(short: params[:short])
    if @url then redirect_to @url.original
    else
      render json: { error: 'Short URL not found' }, status: :not_found
    end
  end

  private

  def url_params
    params.require(:url).permit(:original, @short_url)
  end

end
