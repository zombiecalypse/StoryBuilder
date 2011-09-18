require 'set'
class Story < ActiveRecord::Base
  scope :all_but, lambda{|story| story ? {:conditions => ["id != ?", story.id]} : {} }
  #attr_accessor :title, :description, :mood
  has_many :roles
  has_many :characters, :through => :roles
  belongs_to :superplot, :class_name => 'Story'
  has_many :subplots, :class_name => 'Story', :foreign_key => :superplot_id
  has_attached_file :picture, 
    :styles => { :medium => "300x200>", :thumb => "100x100#" },
    :default_url => "/:class/:attachment/missing_:style.png",
    :url => "/:class/:attachment/:id/:style_:basename.:extension" 
  validate :acyclic?

  def to_s
    title
  end

  def shortness_threshold
    300
  end

  def recursive_children current=Set.new
    for child in subplots
      if current.add? child
        current += child.recursive_children current
      end
    end
    current
  end

  def acyclic?
    errors.add(:superplot, "Superplot has itself at subplot") if superplot and recursive_children.include?(superplot)
  end
end
