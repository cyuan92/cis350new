# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Cis350new::Application.initialize!

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
   :tls => true,
   :address => "smtp.gmail.com",
   :port => 465,
   :domain => "gmail.com",
   :authentication => :login,
   :user_name => "expressoapp2",
   :password => "expresso1234"
 }
