class Payment < ApplicationRecord
  belongs_to :user

  after_create :update_paid

  def self.price(current_user)
    if current_user.service == "Starter"
      return 150_00
    elsif current_user.service == "Standard"
      return 280_00
    elsif current_user.service == "Premium"
      return 390_00
    end
  end

  private

  def update_paid
    user_id = self.user_id
    user = User.find(user_id)
    user.paid = true
  end

end
