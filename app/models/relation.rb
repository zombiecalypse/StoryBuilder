class Relation < ActiveRecord::Base
  belongs_to :first, :class_name => 'Character'
  belongs_to :second, :class_name => 'Character'
end
