#!/usr/bin/env ruby
require 'date'

key = ''					# the worldweatheronline.com free key
interval = 900					# Loop interval
lat = '58.970'
long = '17.405'

# Loop forever
loop do
  # Get outside temp in C
  temp = %x{/usr/bin/curl -s 'http://api.worldweatheronline.com/free/v1/weather.ashx?q=#{lat}%2C#{long}&format=json&num_of_days=1&key=#{key}'|awk -F: '{print $10}'|awk -F, '{print $1}'| awk -F\\" '{print $2}'}.to_i
  # Log the temp to logfile
  open('/root/outsidetemp.csv', 'a+') do |f|
   f.puts "#{DateTime.now}	#{temp}"
  end
  sleep interval
end
