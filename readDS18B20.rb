#!/usr/bin/env ruby
# Tom Eklöf, tom@linux-konsult.com
# Read temperature data from a DS18B20 1-Wire temp sensor
# Just provide the w1_slave file to read.
# Usage example:
# temp = Temperature.new('/sys/bus/w1/devices/28-000005b5ec65/w1_slave')
# puts "#{temp.celcius}"


class Temperature
    attr_reader :celcius, :fahrenheit
    def initialize(w1file)
        @celcius = -999
        @fahrenheit = -999
        @device_file = w1file
        #@device_file = ARGV[0]
        `sudo modprobe w1-gpio`
        `sudo modprobe w1-therm`

        read_temp
    end
end

def read_temp_raw
    File.open(@device_file, 'r') do |f|
        lines = f.readlines()
    end
end

def read_temp
    lines = read_temp_raw()
    temp_c = 0
    temp_f = 0
    while !lines[0].strip().end_with? 'YES'
        sleep(0.2)
        lines = read_temp_raw
    end
    equals_pos = lines[1].rindex('=')
    if equals_pos != -1
        line=lines[1].strip
        line=line[line.index('=') + 1, line.length - line.index('=') + 1]
        temp_c = line.to_f / 1000.0
        temp_f = temp_c * 9.0 / 5.0 + 32.0
        @celcius = temp_c
        @fahrenheit = temp_f
    end
end

