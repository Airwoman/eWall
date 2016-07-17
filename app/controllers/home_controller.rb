class HomeController < ApplicationController
  def index

    @groups = Group.last(5).reverse
    @users = User.last(5).reverse
    @photos = Photo.last(6).reverse
  end
end
