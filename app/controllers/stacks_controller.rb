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

  end

  def create
    @stack = Stack.new(stack_params)

    respond_to do |format|
      if @stack.save
        format.html { redirect_to @stack, notice: 'Stack was successfully created.' }
        format.json { render :show, status: :created, location: @stack }
      else
        format.html { render :new }
        format.json { render json: @stack.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy

  end

  private
    def set_stack
      @stack = Stack.find(params[:id])
    end

    def stack_params
      params.require(:stack).permit(:img_url, :user_id)
    end
end
