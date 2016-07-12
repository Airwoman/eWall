class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy, :like]

  # GET /photos
  # GET /photos.json
  def index
    @photos = Photo.all
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    user=User.all
    @uploader = user.find(@photo.uploader_id)
  end

  # GET /photos/new
  def new
    @photo = Photo.new
  end

  # GET /photos/1/edit
  def edit
  end

  # POST /photos
  # POST /photos.json
  def create
    images = params['images']
    images.each do |image|
      photo = Photo.new photo_params
      photo.image = image
      photo.save
    end
    redirect_to photos_path, notice: 'Photo was successfully created.'

  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    respond_to do |format|
      @photo.attributes = photo_params
      @photo.image = @photo.image_was + photo_params['image']

      if @photo.save
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @photo }
      else
        format.html { render :edit }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo.destroy
    respond_to do |format|
      format.html {
        redirect_to photos_url, notice: 'Photo was successfully destroyed.' }
      format.json {
        render :json => {}
      }
    end
  end

  def like
    if @photo.likes.include? @current_user
      @photo.likes.delete @current_user
    else
      @photo.likes << @current_user
    end
    render json: 'ok', status: :ok
  end

  def unlike

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_photo
    @photo = Photo.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def photo_params
    params.require(:photo).permit(:description, :uploader_id, :group_id)
  end
end
