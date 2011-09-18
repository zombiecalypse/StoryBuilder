module ApplicationHelper
  def title(title=nil, &block)  
    if block_given?
      content_for(:title, capture(&block))
    else
      content_for(:title) { title }
    end
  end  
end
