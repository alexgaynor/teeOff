class User < ActiveRecord::Base
  attr_accessible :email, :name, :zip
  def goodWeather?
  		f = getWeather
		day = f[2]
		condition = day["skyicon"]
		puts condition
		condition =~ /sunny/
	end
  def text 
	puts "Texting #{name}"
  end
  def getWeather
  	w = Wunderground.new(zip)
  	w.forecast
  end
end
