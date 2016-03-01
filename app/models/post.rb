class Post < ActiveRecord::Base
  validate :image, presence: true
  has_attached_file :image, styles: { :medium => "640px"}
end
