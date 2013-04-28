class User < ActiveRecord::Base
  attr_accessible :email, :name, :zip, :number
  def goodWeather?
  		f = getWeather
		day = f[2]
		condition = day["skyicon"]
		puts condition
		condition =~ /sunny/
		true
	end
  def text 
  	return unless number
	puts "Texting #{name}"
	account_sid = "ACcdfbff925e99dd7e80d9cf05200c6baf"
	auth_token = "150353c2cc3b539205fb41e5de42ce9c"
	client = Twilio::REST::Client.new account_sid, auth_token
	client.account.sms.messages.create(
	    :from => "+12038830667",
	    :to => number,
	    :body => "Hey #{name}, if you don't golf on #{twoDaysFromNow}, you'll be very sorry!!"
	  )
	puts "Hello Golf World"
  end
  def getWeather
  	w = Wunderground.new(zip)
  	w.forecast
  end
  def twoDaysFromNow
  	2.day.from_now.strftime("%A")
  end
end
