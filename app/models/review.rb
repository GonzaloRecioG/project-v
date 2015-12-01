class Review < ActiveRecord::Base
  belongs_to :experience

  RATINGS = [0, 1, 2, 3, 4, 5]
end

