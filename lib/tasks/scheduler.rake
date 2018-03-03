desc "This task is called by the Heroku scheduler add-on"
task :update_feed => :environment do
  puts "Updating feed..."
  NewsFeed.update
  puts "Done."
end

desc "Reminder email sent before the first session"
task :first_session_reminder => :environment do
  users = User.all
  users.each do |user|
    if user.appointment
      if (Time.zone.now >= (user.appointment - 48.hours)) && (Time.zone.now < user.appointment)
        UserMailer.first_session_email(user).deliver
      end
    end
  end
end

desc "Reminder email sent before the second session"
task :second_session_reminder => :environment do
  users = User.all
  users.each do |user|
    if user.second_appointment 
      if (Time.zone.now >= (user.second_appointment - 48.hours)) && (Time.zone.now < user.second_appointment)
        UserMailer.second_session_email(user).deliver
      end
    end
  end
end

desc "Reminder email sent before the third session"
task :third_session_reminder => :environment do
  users = User.all
  users.each do |user| 
    if user.third_appointment
      if (Time.zone.now >= (user.third_appointment - 48.hours)) && (Time.zone.now < user.third_appointment)
        UserMailer.third_session_email(user).deliver
      end
    end
  end
end