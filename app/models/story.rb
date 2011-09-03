class Story < ActiveRecord::Base
  has_many :roles
  has_many :characters, :through => :roles
end
