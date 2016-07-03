class Photo < ActiveRecord::Base
  mount_uploaders :image, ::ImageUploader
  has_and_belongs_to_many :groups
end
