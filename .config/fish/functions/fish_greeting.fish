function fish_greeting

	#user whoami
	# hostname (hostname | sed 's/.local//g')

# distro="OS X $(sw_vers -productVersion)"
# kernel=$(uname)
# uptime=$(uptime | sed 's/.*up \([^,]*\), .*/\1/')
# shell="$SHELL"
# terminal="$TERM ${TERM_PROGRAM//_/ }"
# cpu=$(sysctl -n machdep.cpu.brand_string)
# battery=$(ioreg -c AppleSmartBattery -r | awk '$1~/Capacity/{c[$1]=$3} END{OFMT="%.2f%"; max=c["\"MaxCapacity\""]; if (max>0) { print 100*c["\"CurrentCapacity\""]/max;} }')

# # removes (R) and (TM) from the CPU name so it fits in a standard 80 window
# cpu=$(echo "$cpu" | awk '$1=$1' | sed 's/([A-Z]\{1,2\})//g')

# ram="$(( $(sysctl -n hw.memsize) / 1024 ** 3  )) GB"
# disk=$(df | head -2 | tail -1 | awk '{print $5}')

# echo "$PWD"
# echo (whoami)

#fish_logo

end
