require 'rubygems'
require 'twilio-ruby'
 
account_sid = "ACcdfbff925e99dd7e80d9cf05200c6baf"
auth_token = "150353c2cc3b539205fb41e5de42ce9c"
client = Twilio::REST::Client.new account_sid, auth_token
 
from = "+12038830667" # Your Twilio number

client.account.sms.messages.create(
    :from => from,
    :to => "8472198743",
    :body => ""
  )
puts "Hello Golf World"