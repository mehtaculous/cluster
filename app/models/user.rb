class User < ApplicationRecord  
  devise :database_authenticatable, :registerable, :recoverable, 
         :rememberable, :trackable, :validatable, :confirmable

  has_many :payments

  before_save :first_appointment_conflict

  def after_confirmation
    UserMailer.welcome_email(self).deliver
  end

  private 

  def first_appointment_conflict
    users = User.all
    users.each do |user|
      conflict_date = self.appointment.strftime("%Y/%m/%d") 
      user_first_appointment = user.appointment.strftime("%Y/%m/%d") if user.appointment
      user_second_appointment = user.second_appointment.strftime("%Y/%m/%d") if user.second_appointment
      user_third_appointment = user.third_appointment.strftime("%Y/%m/%d") if user.third_appointment
      if (conflict_date == user_first_appointment) || (conflict_date == user_second_appointment) || (conflict_date == user_third_appointment)
        # flash[:error] = "I'm sorry but that appointment date is filled up. Please select another day."
      end
    end
  end

end
