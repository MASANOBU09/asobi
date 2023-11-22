class Vacation < ApplicationRecord
    belongs_to :user
    mount_uploader :image, ImageUploader
    attribute :body, :text
end
