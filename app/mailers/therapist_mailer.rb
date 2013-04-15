class TherapistMailer < ActionMailer::Base
  default :to => therapist.email, :from => "expressoapp2@gmail.com"

  def registration_confirmation(therapist)
    mail(:subject => "Registered with Expresso")
  end
end
