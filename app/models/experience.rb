class Experience < ActiveRecord::Base


  CATEGORIES = ["Homeless", "Greenpeace", "Animals", "Old people", "Food giving"]

  has_attached_file :picture,
    styles: { medium: "300x300>", thumb: "100x100>" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/

  has_many :reviews, dependent: :destroy

end
