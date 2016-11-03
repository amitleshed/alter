class Product < ActiveRecord::Base
  validates_presence_of(:name, :kind, :image, :describe, :age, :contact, :zipcode, :size, :city)
  def say_name(given_name)
    self.name.upcase == given_name.upcase
  end

  def Product.search(parameter) 
  where("products.zipcode LIKE ? OR products.city LIKE ?", "%#{parameter}%", "%#{parameter}%")
  end
end


