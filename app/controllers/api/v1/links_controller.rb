class Api::V1::LinksController < ApplicationController
  respond_to :json

  def index
    links = current_user.links.all
    respond_with links
  end

  def update
    link = current_user.links.find(params[:id])
    link.update(link_params)
    respond_with link, json: link
  end

  private

  def link_params
    params.permit(:id, :title, :url, :read)
  end
end
