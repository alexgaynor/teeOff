namespace :notify do
  desc "TODO"
  task :text => :environment do 
  	puts "Hello WOrld"
  	User.all.each do |user| 
  		if user.goodWeather? 
  			user.text
  		else 
  			puts "not good weather"
  		end
  	end
  end
end