class Ewall < ActiveRecord::Base
  belongs_to :ewall_user, class_name: 'User', foreign_key: :user_id
  belongs_to :ewall_photo, class_name: 'Photo', foreign_key: :photo_id
end
