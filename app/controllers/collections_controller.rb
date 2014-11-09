class CollectionsController < ApplicationController
  before_action :require_authentication, only: [:create]

  def create

    collection = logged.collections.build
    collection.item_id = params[:item_id]
    collection.repeated = params[:repeated]

    if collection.save
      render json: true
    else
      render json: false
    end
  end

end