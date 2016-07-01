class User < ActiveRecord::Base
  has_secure_password
  mount_uploader :image, ::ImageUploader
  has_and_belongs_to_many :groups
end
