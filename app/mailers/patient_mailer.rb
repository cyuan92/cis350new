class PatientMailer < ActionMailer::Base
  default :to => patient.email, :from => "expressoapp@gmail.com"

 def registration_confirmation(patient)
   mail(:subject => "Registered with Expresso")
 end
end

