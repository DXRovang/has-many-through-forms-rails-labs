class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  accepts_nested_attributes_for :categories

  has_many :comments
  has_many :users, through: :comments

  def category_ids=(ids)
    ids.each do |id|
      category = Category.find(id)
      self.categories << category
    end
  end
 

end
