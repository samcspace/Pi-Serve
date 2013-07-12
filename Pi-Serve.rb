require "colored"
require "piface"

# To turn the LED either off or on change the second number to either 1 or 0
# 1=on 0=off
# To change the interval between off or on change the number after sleep. 01 = 1 second
Piface.write 0,1
Piface.write 1,1
Piface.write 2,1
Piface.write 3,1
Piface.write 4,1
Piface.write 5,1
Piface.write 6,1
Piface.write 7,1
sleep 01
Piface.write 8,1
Piface.write 0,0
Piface.write 1,0
Piface.write 2,0
Piface.write 3,0
Piface.write 4,0
Piface.write 5,0
Piface.write 6,0
Piface.write 7,0
Piface.write 8,0

puts "                                "
puts "Server Test (pi edition) v1.0.5 Alpha".white_on_green
puts "By Sam Cornwall".black_on_white
puts "Copyright samcspace ".black_on_white
puts "_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ "
puts "- - - - - - - - - - - - - - - - "
puts " "

sleep 03

loop do

# Change The IP in the squrae brackets to the Website/IP adress you wish to test
# Give the IP/Website a name by replaceing 'server 1' after the colon
servers['192.168.254.55'] = :server1
servers['190.75.176.60'] = :server2
servers['190.200.51.234'] = :server3

def ping?(addr)
  output = `ping -c 1 #{addr}`
  !output.include? "0 received"
end

# to set a specific LED to a server change counter to either 0-7
# Note that this will set the LED for the first server noted and therefore the other servers will follow after it
# e.g. server 1 is set to LED 4, this means that server 2 will be LED 5 and server 3 will be LED 6
 counter = 1
 servers.keys.each  do |address|
 
  if ping? address
    puts "#{servers[address]}".blue_on_white + " is operational".bold.green
  Piface.write counter,1
  else
    puts "#{servers[address]}".blue_on_white + " is experiencing Faults".bold.red
  Piface.write counter,0
  end
  counter += 1
 end

puts " "
puts "All Servers have been tested !".bold.blue
puts " "

sleep 01
end
