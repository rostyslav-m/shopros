class Product < ActiveRecord::Base
  has_many   :reviews, :dependent => :destroy
  belongs_to :category
  validates  :title, presence: true,
                     length: { minimum: 5 }
end
