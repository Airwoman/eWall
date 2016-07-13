class StacksController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_action :set_stack, only: [:show, :destroy]

  def new
    @stack = Stack.new
    respond_to do |format|
      format.html #new.html.erb
      format.json { render json: @stack}
    end
  end

  def show
    # render json: @stack
  end

  def create
    @stack = Stack.new(stack_params)

    if @stack.save
      render json: @stack.to_json
    else
      render json: @stack.errors, status: :unprocessable_entity
    end

  end

  def destroy
    @stack.destroy
    render json: @stack.to_json
  end

  private
    def set_stack
      @stack = Stack.find(params[:id])
    end

    def stack_params
      params.require(:stack).permit(:photo_id, :user_id)
    end
end
