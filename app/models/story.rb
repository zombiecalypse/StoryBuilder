class Story < ActiveRecord::Base
  scope :all_but, lambda{|story| story ? {:conditions => ["id != ?", story.id]} : {} }
  has_many :roles
  has_many :characters, :through => :roles
  belongs_to :superplot, :class_name => 'Story'
  has_many :subplots, :class_name => 'Story'
  has_attached_file :picture, 
    :styles => { :medium => "300x200>", :thumb => "100x100#" },
    :default_url => "/:class/:attachment/missing_:style.png",
    :url => "/:class/:attachment/:id/:style_:basename.:extension" 

  def to_s
    title
  end
end
