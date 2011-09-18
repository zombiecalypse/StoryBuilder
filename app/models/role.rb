class Role < ActiveRecord::Base
  belongs_to :character
  belongs_to :story
  validates :character, :story, :presence => true
end
