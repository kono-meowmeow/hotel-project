class Hotel < ApplicationRecord

    mount_uploader :image, PictureUploader 

    belongs_to :prefecture

    has_many :reviews
    has_many :bookings

end
