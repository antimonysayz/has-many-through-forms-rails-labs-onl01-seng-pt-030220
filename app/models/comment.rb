class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  accepts_nested_attributes_for :user,  reject_if: proc { |attributes|['username'].blank? }

  def user_attributes=(user_attributes)
    if user_attributes[:username] != ""
      user = User.find_or_create_by(username: user_attributes[:username])
      self.user = user
    end
  end

end
