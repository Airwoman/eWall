class Photo < ActiveRecord::Base
  mount_uploaders :image, ::ImageUploader
  has_and_belongs_to_many :groups
  belongs_to :user, :foreign_key => :uploader_id
  has_and_belongs_to_many :likes, class_name: 'User', :foreign_key => :user_id
end
