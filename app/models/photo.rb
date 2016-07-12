class Photo < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :group
  belongs_to :user, :foreign_key => :uploader_id
  has_and_belongs_to_many :likes, class_name: 'User', :foreign_key => :photo_id
end
