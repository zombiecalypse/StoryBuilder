class Character < ActiveRecord::Base
  has_many :roles
  has_many :stories, :through => :roles
  has_many :relations
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
end
