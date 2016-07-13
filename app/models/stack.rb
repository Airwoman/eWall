class Stack < ActiveRecord::Base
  belongs_to :temp_user, class_name: 'User', foreign_key: :user_id
  belongs_to :temp_photo, class_name: 'Photo', foreign_key: :photo_id
end
