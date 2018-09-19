class Post < ApplicationRecord
  has_many   :comments
  belongs_to :user, optional: true

  mount_uploader :image, ImageUploader

end
