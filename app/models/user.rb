class User < ActiveRecord::Base
  attr_accessible :name, :zip, :number, :homeCourse, :ziip
  def goodWeather?
  		f = getWeather
		day = f[2]
		
		#puts condition
		#htemp = day["high"]
		#highT = htemp["fahrenheit"]

		#puts highT
		condition = day["skyicon"]
		condition =~ /sunny/

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
	    :body => "Hey #{name}, if you don't golf on this beautiful #{temp} degree #{twoDaysFromNow}, you'll be very sorry!! Call #{homeCourse}, for a tee time"
	  )
	puts "Hello Golf World"
  end
  def getWeather
  	w = Wunderground.new(ziip)
  	w.forecast
  end
  def twoDaysFromNow
  	2.day.from_now.strftime("%A")
  end
  def temp 
  	f = getWeather
  	day = f[2]
  	htemp = day["high"]
	highT = htemp["fahrenheit"]
  end
end
