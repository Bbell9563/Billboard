class Billboard < ApplicationRecord
  has_many :songs
  has_many :artists, :through => :songs
end
