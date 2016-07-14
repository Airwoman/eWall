class HomeController < ApplicationController
  def index
    @groups = Group.order(:created_at).take(5)
    @users = User.order(:created_at).take(5)
    @photos = Photo.order(:created_at).take(10)
  end
end
