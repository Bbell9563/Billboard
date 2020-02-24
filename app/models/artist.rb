class Artist < ApplicationRecord
  has_many :songs, dependent: :destroy

  # validates_presence_of :name

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
