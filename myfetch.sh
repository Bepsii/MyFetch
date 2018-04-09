PATH=$PATH:~/etc:~/proc
export PATH
kernal_name=$(uname -s)
distro=$(cat /etc/*release | grep -w ID | sed 's/ID=//g' )
MemTotal=$(cat /proc/meminfo | grep MemTotal | sed 's/MemTotal:       //g' | sed 's/ kB//g')
MemTotal=$(($MemTotal/1024))
MemFree=$(cat /proc/meminfo | grep MemFree | sed 's/MemFree:        //g' | sed 's/ kB//g')
MemFree=$(($MemFree/1024))
MemUsed=$(($MemTotal-MemFree))
ram="${MemUsed}/${MemTotal}"
cpu=$(lscpu | grep "Model name" | sed 's/Model name:            //g')
uptime=$(uptime -p | sed 's/up //g')
c1=$(tput setaf 1)
c2=$(tput setaf 2)
c3=$(tput setaf 3)
c4=$(tput setaf 4)
c5=$(tput setaf 5)
c6=$(tput setaf 6)
sb=$(tput bold)
reset=$(tput sgr0)
case $kernal_name in
	"Linux" | "GNU" )
		os="Linux"
		 ;;
	"CYGWIN"* | "MYSY"* | "MINGW"* )
		os="Windows"
		;;
	*)
		os="Unknown"
		;;
esac
echo "${c1}${sb}OS:     ${reset}${c6}${os}"
echo "${c1}${sb}Distro: ${reset}${c6}${distro}"
echo "${c1}${sb}Uptime: ${reset}${c6}${uptime}"
echo "${c1}${sb}CPU:    ${reset}${c6}${cpu}"
echo "${c1}${sb}RAM:    ${reset}${c6}${ram}"
