class Character < ActiveRecord::Base
  scope :all_but, lambda{|char| char ? {:conditions => ["id != ?", char.id]} : {} }
  has_many :roles
  has_many :stories, :through => :roles
  has_many :relations
  has_many :related_characters, :through => :relations, :source => :towards
  has_attached_file :avatar, 
    :styles => { :medium => "300x300>", :thumb => "100x100#" }, 
    :default_url => "/:class/:attachment/missing_:style.png",
    :url => "/:class/:attachment/:id/:style_:basename.:extension" 

  def to_s
    name
  end

  def shortness_threshold
    200
  end
end
