class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  accepts_nested_attributes_for :categories, reject_if: proc { |att| att['name'].blank? }
  # accepts_nested_attributes_for :comments
  # accepts_nested_attributes_for :users

  has_many :comments
  has_many :users, through: :comments

  def category_ids=(ids)
    ids.each do |id|
      category = Category.find(id)
      self.categories << category
    end
  end
 

end
