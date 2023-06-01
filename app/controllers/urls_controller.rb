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
    @short_url = UrlConverter.encode(params[:original])
    @url = Url.new(url_params.merge(short: @short_url))
    # TODO: Do you only want to render JSON for testing? 
    if @url.save
      # TODO: Probably will want to uncomment the line below and comment out
      # the one underneath, because likely will j. want short URL and not both.
      # Only have both showing for test purposes.

      # TODO: Altho act. can possibly j. call test routes --> show all? Might 
      # want to make route j. to show one by ID. Might be able to not have this
      # like this (with right one commented out).

      # render json: { short: url_for(@url.short) }, status: :created
      render json: @url
    else
      render json: { error: 'Failed to create short URL' }, status: :unprocessable_entity
    end
  end

  def decode
    @url = Url.find_by(short: params[:short])

    # TODO: Uncomment line below and comment out one underneath. Current 
    # situation exists for testing purposes.

    # if @url then redirect_to @url.original
    if @url then render json: @url
    else
      render json: { error: 'Short URL not found' }, status: :not_found
    end
  end

  private

  def url_params
    params.permit(:original)
  end

end
