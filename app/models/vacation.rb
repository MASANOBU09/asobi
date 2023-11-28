class Vacation < ApplicationRecord
    belongs_to :user
    mount_uploader :image, ImageUploader
    attribute :body, :text
    validates :review, presence: true
end
