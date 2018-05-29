class Wishlist < ApplicationRecord
  # Direct associations

  has_many   :items,
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

end
