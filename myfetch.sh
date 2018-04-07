kernal_name=$(uname -s)
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
echo "$os"
