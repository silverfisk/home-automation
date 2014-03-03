#!/usr/bin/env ruby
# Tom Eklöf, tom@linux-konsult.com
# Control a heat circulation pump with a TellStick and usb termometer (tdtool and temperv14 have to be installed)

require 'date'

####	Settings	####
interval = 1800					# Number of seconds we loop for temp logging and adjustments
tdunit = 4					# tdtool --list gives you the correct unit number
temptarget = 22.5				# Our target temperature
####	/Settings	####

### 	Functions	####
def actionlog( action="", unit="" )		# Log our actions
	open('/root/action.log', 'a+') do |a|
		time = DateTime.now
		a.puts "#{time}	#{action}	#{unit}"
	end
end

def get_temp
	%x{/root/bin/temperv14 -c}.to_f
end
### 	/Functions	####


# Loop forever
loop do
 time = DateTime.now

 # Get Temp and log it
 livingroom = get_temp
 # Log the temperature
 open('/root/templog.csv', 'a+') do |t|
  t.puts "#{time}	#{livingroom}"
 end

 if livingroom <  temptarget
  %x{/usr/bin/tdtool --on #{tdunit}}
  actionlog "on", "#{tdunit}"
 else
  %x{/usr/bin/tdtool --off #{tdunit}}
    actionlog "off", "#{tdunit}"
 end

 %x{/root/bin/plotTemp.gnuplot}			# Run an external gnuplot script to publish a temp graph
 sleep interval
end
