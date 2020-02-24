class Song < ApplicationRecord
  belongs_to :artist
  belongs_to :billboard, optional: true
  has_many :comments, dependent: :destroy
end
