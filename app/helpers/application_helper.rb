module ApplicationHelper
  def title(value)
    unless value.nil?
      @title = "#{value} | Rel"      
    end
  end
end
