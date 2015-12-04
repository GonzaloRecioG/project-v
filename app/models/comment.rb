class Comment < ActiveRecord::Base
  belongs_to :user
  validates :content, length: { minimum: 20 }
end
