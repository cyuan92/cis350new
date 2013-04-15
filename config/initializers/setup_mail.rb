ActionMailer::Base.smtp_settings = {  
  :address              => "smtp.gmail.com",  
  :port                 => 465,  
  :domain               => "gmail.com",  
  :user_name            => "expressoapp2",  
  :password             => "expresso1234",  
  :authentication       => "plain",  
  :enable_starttls_auto => true  
}  
