PATH=$PATH:~/etc
export PATH
kernal_name=$(uname -s)
distroID=$(cat /etc/*release | grep -w ID )
case $kernal_name in
	"Linux" | "GNU" )
		os="Linux"
		#distros are just checking distro id for the distro name
			case $distroID in  
			       	*"debian"* )
					distro="Debian"
					;;
				*"ubuntu"* )
					distro="Ubuntu"
					;;
				*"opensuse"* )
					distro="openSUSE"
					;;
				*)
					distro="Unknown, Please contact me on github for support of your distro"
					;;
			esac
		;;
	"CYGWIN"* | "MYSY"* | "MINGW"* )
		os="Windows"
		;;
	*)
		os="Unknown"
		;;
esac
echo "$distroID"
echo "$os"
echo "$distro"
