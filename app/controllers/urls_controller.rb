class UrlsController < ApplicationController
  def encode
    @url = Url.new(url_params)
    if @url.save
      # TODO: Fairly sure this is insufficient encoding.
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
    params.require(:url).permit(:original, :short)
  end

end
