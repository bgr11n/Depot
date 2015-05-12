class Product < ActiveRecord::Base
  validates :title, :description, :image_url, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validates_length_of :title, :maximum => 10, :message => "less than 10 if you don't mind"
  validates_uniqueness_of :title
  validates :image_url, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png)\z}i,
    message: 'URL should end with GIF, JPG or PNG.'
  }
end
