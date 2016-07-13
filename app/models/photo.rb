class Photo < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :group
  belongs_to :user, :foreign_key => :uploader_id
  has_many :temp_users, class_name: 'User', through: :stacks
  has_many :stacks
  has_and_belongs_to_many :likes, class_name: 'User', :foreign_key => :photo_id
end
