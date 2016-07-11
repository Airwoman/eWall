class User < ActiveRecord::Base
  has_secure_password
  mount_uploader :image, ImageUploader
  has_and_belongs_to_many :groups
  has_many :stacks
  has_many :photos
  has_and_belongs_to_many :favorites, class_name: 'Photo', :foreign_key => :photo_id
end
