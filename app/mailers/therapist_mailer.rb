class TherapistMailer < ActionMailer::Base
  default :to => therapist.email, :from => "expressoapp@gmail.com"

  def registration_confirmation(therapist)
    mail(:subject => "Registered with Expresso")
  end
end
