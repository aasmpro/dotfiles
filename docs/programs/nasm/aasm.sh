#!/bin/bash
# simple bash file for making program from nasm assembly output file
# require nasm and ld being installed

FNN=$1
RNN=$2
ST='elf'
if [ $(uname -m) == 'x86_64' ]; then
	ST="$ST""64";
fi

function asm_f {
	nasm -f $ST $FNN
	IFS='.' read -r -a FN <<< "$FNN"
	ld -s -o "${FN[0]}" "${FN[0]}.o"

	case "$RNN" in
		run)
			./"${FN[0]}"
		;;
	esac
}

function ins_f {
	sudo cp "$PWD/aasm.sh" /usr/bin/
	sudo mv "/usr/bin/aasm.sh" "/usr/bin/aasm"
}

function rem_f {
	sudo rm "/usr/bin/aasm"
}

function help_f {
	echo "usage:"
	echo "$ /path/to/aasm.sh ins"
	echo "	> copying aasm.sh to /usr/bin/ as aasm."
	echo ""
	echo "$ aasm rem"
	echo "	> removing /usr/bin/aasm."
	echo ""
	echo "$ aasm help"
	echo "	> showing this help."
	echo ""
	echo "$ aasm [file.asm] [run]"
	echo "	> creating file.o and file (program) in the same directory."
	echo "	> the run command is optional, for running file after assembling."
	echo ""
	echo "report bugs to aasmpro@gmail.com"
	echo "github repo: https://github.com/aasmpro/aasm/"
}

if [ ! $FNN ]; then
	echo "assembly file not found."
	help_f
else
	case "$FNN" in
		help)
			help_f
			;;
		ins)
			ins_f
			;;
		rem)
			rem_f
			;;
		*)
			asm_f
			;;
	esac
fi
