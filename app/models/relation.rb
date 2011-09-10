class Relation < ActiveRecord::Base
  belongs_to :character
  belongs_to :towards, :class_name => 'Character'
  validates :character, :towards, :short, :presence => true
  validates_uniqueness_of :towards, :scope => :character
end
