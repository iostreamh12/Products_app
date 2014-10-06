class Product < ActiveRecord::Base

  def self.search_and_order(search, page_number)
    if search
      where("descripcion LIKE ?", "%#{search.downcase}%").order(
      clave: :desc, descripcion: :asc
      ).page page_number
    else
      order(clave: :desc, descripcion: :asc).page page_number
    end
  end

end
