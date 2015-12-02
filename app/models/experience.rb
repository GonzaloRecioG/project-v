class Experience < ActiveRecord::Base

  CATEGORIES = ["Homeless", "Greenpeace", "Animals", "Old people", "Food giving"]

  has_attached_file :picture,
    styles: { medium: "300x300>", thumb: "100x100>" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/

  has_many :reviews, dependent: :destroy
  has_many :bookings

  geocoded_by :full_address
  after_validation :geocode, if: :address_changed?

  def full_address
    [address, city].compact.join(', ')
  end

end
