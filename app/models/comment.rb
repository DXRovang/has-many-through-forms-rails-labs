class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  def user_username=(username)
    self.user.username = User.find_by(username: username)
  end

  def user_username
    self.user ? self.user.username : nil
  end
end
