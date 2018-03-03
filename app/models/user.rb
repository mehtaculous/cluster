class User < ApplicationRecord  
  devise :database_authenticatable, :registerable, :recoverable, 
         :rememberable, :trackable, :validatable, :confirmable

  has_many :payments

  validate :first_appointment_date
  validate :second_appointment_date
  validate :third_appointment_date

  def after_confirmation
    UserMailer.welcome_email(self).deliver
  end

  def disable_service
    if self.appointment
      if self.appointment < Time.zone.now
        return ['Starter', 'Standard', 'Premium']
      end
    end
  end

  def disable_appointment
    if self.appointment
      if self.appointment < Time.zone.now
        return true
      end
    end
  end

  def disable_second_appointment
    if self.second_appointment
      if self.second_appointment < Time.zone.now
        return true
      end
    end
  end

  def disable_third_appointment
    if self.third_appointment
      if self.third_appointment < Time.zone.now
        return true
      end
    end
  end

  private

  def first_appointment_date
    users = User.all
    users.each do |user|
      conflict_date = self.appointment.strftime("%Y/%m/%d") if self.appointment
      user_first_appointment = user.appointment.strftime("%Y/%m/%d") if user.appointment
      user_second_appointment = user.second_appointment.strftime("%Y/%m/%d") if user.second_appointment
      user_third_appointment = user.third_appointment.strftime("%Y/%m/%d") if user.third_appointment
      if conflict_date
        if (conflict_date == user_first_appointment) || (conflict_date == user_second_appointment) || (conflict_date == user_third_appointment)
          # errors.add(:appointment, "I'm sorry but that appointment date is filled up. Please select another day.")
        end
      end
    end
  end

  def second_appointment_date
    users = User.all
    users.each do |user|
      conflict_date = self.second_appointment.strftime("%Y/%m/%d") if self.second_appointment
      user_first_appointment = user.appointment.strftime("%Y/%m/%d") if user.appointment
      user_second_appointment = user.second_appointment.strftime("%Y/%m/%d") if user.second_appointment
      user_third_appointment = user.third_appointment.strftime("%Y/%m/%d") if user.third_appointment
      if conflict_date
        if (conflict_date == user_first_appointment) || (conflict_date == user_second_appointment) || (conflict_date == user_third_appointment)
          # errors.add(:second_appointment, "I'm sorry but that appointment date is filled up. Please select another day.")
        end
      end
    end
  end

  def third_appointment_date
    users = User.all
    users.each do |user|
      conflict_date = self.third_appointment.strftime("%Y/%m/%d") if self.third_appointment
      user_first_appointment = user.appointment.strftime("%Y/%m/%d") if user.appointment
      user_second_appointment = user.second_appointment.strftime("%Y/%m/%d") if user.second_appointment
      user_third_appointment = user.third_appointment.strftime("%Y/%m/%d") if user.third_appointment
      if conflict_date
        if (conflict_date == user_first_appointment) || (conflict_date == user_second_appointment) || (conflict_date == user_third_appointment)
          # errors.add(:third_appointment, "I'm sorry but that appointment date is filled up. Please select another day.")
        end
      end
    end
  end

end
