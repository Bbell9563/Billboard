class Artist < ApplicationRecord
  has_many :songs, dependent: :destroy

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
