class Picture < ApplicationRecord
  belongs_to :user
  validates :image, :content, presence: true
end
