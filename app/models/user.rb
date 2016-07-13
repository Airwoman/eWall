class User < ActiveRecord::Base
  has_secure_password
  mount_uploader :image, ImageUploader
  has_and_belongs_to_many :groups
  has_many :photos
  has_many :temp_photos, class_name: 'Photo', through: :stacks
  has_many :stacks
  has_many :ewall_photos, class_name: 'Photo', through: :ewalls
  has_many :ewalls
  has_and_belongs_to_many :favorites, class_name: 'Photo', :foreign_key => :user_id
end
