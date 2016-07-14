class EwallsController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_action :set_ewall, only: [:show, :update, :destroy]

  def new
    @ewall = Ewall.new
    respond_to do |format|
      format.html #new.html.erb
      format.json { render json: @ewall}
    end
  end

  def create
    @ewall = Ewall.new(ewall_params)

    if @ewall.save
      render json: @ewall.as_json(include: [:ewall_photo])

    else
      render json: @ewall.errors, status: :unprocessable_entity
    end
  end

  def update
    if @ewall.update(ewall_params)
      render json: @ewall.to_json, status: :ok
    else
      render json: @ewall.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @ewall.destroy
    render json: @ewall.to_json
  end

  private
    def set_ewall
      @ewall = Ewall.find(params[:id])
    end

    def ewall_params
      params.require(:ewall).permit(:photo_id, :user_id, :position_x, :position_y, :width, :height)
    end


end
